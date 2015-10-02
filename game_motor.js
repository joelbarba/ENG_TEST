/******************************************************************************/
/* The JavaScript CODE for the game's motor									  */
/******************************************************************************/

var play_words = $.extend(true, [], words);
var num_quest;
var resposta_correcta;
var total_punts;
var contador_timer;
var temps_partida;

// Retorna un array (llista) sense l'objecte de la posició num (re-ubicant els següents objectes per no deixar la posició buida)
function pop_array(llista, num) { return llista.slice(0, num).concat(llista.slice(num + 1)); }

function iron_up_str(str_input1) {
  return  str_input1.replace(/à/g, 'a')
					.replace(/é/g, 'e')
					.replace(/è/g, 'e')
					.replace(/í/g, 'i')
					.replace(/ó/g, 'o')
					.replace(/ò/g, 'o')
					.replace(/ú/g, 'u')
					.trim();
}



/*********************************************************************************************************************/

function anotar_resultat(sheet_row, result) {
	google.script.run
	   .withSuccessHandler(function(contents) {
	        // Respond to success conditions here.
	        // $('#results').append('<div> DOC modificat </div>');
	      })
	   .withFailureHandler(function(msg) {
	        // Respond to failure conditions here.
	        $('#main-heading').text(msg);
	        $('#main-heading').addClass("error");
	        $('#error-message').show();
	      })
	   .macro_anotar_resultat(sheet_row, result); // Macro de la Google API
}


function carregar_llista() {

	$('#start_button').attr('disabled', 'true');
    $('#id_titol_joc').text('Loading');

    words = [];
    timer_loading.start();

    google.script.run
      .withSuccessHandler(function(contents) {
          // Respond to success conditions here.
          for (var i = 0; i < contents.length; i++) words.push(contents[i]);
          iniciar_partida();
          timer_loading.stop();
      })
      .withFailureHandler(function(msg) {
          // Respond to failure conditions here.
          $('#main-heading').text(msg);
          $('#main-heading').addClass("error");
          $('#error-message').show();
      })
      .macro_llegir_doc(); // Macro de la Google API
}

/*********************************************************************************************************************/


/******************************************************************************/
/* Funció per iniciar els paràmetres de la partida                            */
/******************************************************************************/
function iniciar_partida() {

	// Mostra els objectes de la partida
	$('#id_div_inici').hide();
	$('#id_div_joc').show();

	// Crea el array de les paraules de la partida, i el reordena
	// play_words = $.extend(true, [], words);
	play_words = [];
	var words_tmp = $.extend(true, [], words);
	while (words_tmp.length > 0) {
		var num = Math.floor(Math.random() * words_tmp.length);
		play_words.push(words_tmp[num]);
		words_tmp = pop_array(words_tmp, num);
	}

	// Recompte les paraules de la partida per crear la llista lateral
	$('#id_word_list tbody').empty();

	for (var t = 0; t < play_words.length; t++) {

		play_words[t].play_attempts = 0;
		play_words[t].play_res_ok = 0;

		$('<tr> <td>' + (t + 1) + '</td> '
		+ ' <td>' + play_words[t].word
		     // + ' - ' + play_words[t].sheet_row + '</td> '
		+ ' <td>' + play_words[t].tipus + '</td>'
		// + ' <td>' + play_words[t].meaning + '</td>'
		+ ' </tr>')
		.appendTo('#id_word_list tbody');
	}

	$('#id_word_list td:first-child')
		.css('text-align', 'center')
		.next().css('text-align', 'left').css('padding-left', '8px')
		.next().css('text-align', 'center');

	// Inicialitza comptadors de la partida
	total_punts   = 0;
	num_quest  	  = 0;
	temps_partida = 90;

	actualitzar_marcador();
	preparar_pregunta();

}


/******************************************************************************/
/* Funció per passar a la següent pregunta                                    */
/******************************************************************************/
function next_question() {

	$('#id_word_list tbody tr:eq(' + num_quest + ')').css('border', '');
	$('#id_word_list tbody tr:eq(' + num_quest + ') td:first').css('background-color', ''); // Desmarca la paraula anterior seleccionada

	num_quest++;
	// while ((play_words[num_quest].res_ok > 0) && (num_quest < play_words.length)) { alert('num_quest = ' + num_quest + ' +1'); num_quest++; }

	if (num_quest >= play_words.length) {
		// alert('fi - ' + play_words.length);

		// Comprovar si totes les respostes son correctes
		var all_correct = true;
		for (var t = 0; t < play_words.length; t++) {
		// alert('play_words[' + t + '].play_res_ok = ' + play_words[t].play_res_ok);
		if (play_words[t].play_res_ok == 0) { all_correct = false; }
		}

		if (all_correct) { finalitzar_partida(); return; }
		else { num_quest = 0; }

	}

	if (play_words[num_quest].play_res_ok > 0) next_question();  // Salta recursivament a buscar la següent paraula no resposta correctament
	else    preparar_pregunta();

}


/******************************************************************************/
/* Funció per passar a la següent pregunta                                    */
/******************************************************************************/
function finalitzar_partida() {
	// alert ('Congrats: you answer all ok !');
	// $('#id_div_joc').hide();
	$('#id_titol_joc').text('Vocabulary Test');
	$('#id_div_inici').show();
	$('#start_button').val('RESTART').removeAttr('disabled').focus();
}


/******************************************************************************/
/* Funció per comprovar si la resposta és correcta, i procedir segons         */
/******************************************************************************/
function test_answer() {
	var col_ori = $('#id_div_respostes').css('background-color');
	var ques_result = false;
	var ans_value = iron_up_str($('#id_resposta').val());          // Obté la resposta introduida (sense accents)
	var good_answers = play_words[num_quest].meaning.split(',');   // Obté un array amb totes les possibles respostes correctes

	// Comprova una a una si la resposta és correcte
	for (var t = 0; t < good_answers.length; t++) {
		if (ans_value == iron_up_str(good_answers[t])) ques_result = true;
		// alert('ans_value=' + ans_value + ', good_answers=' + good_answers);
	}

	if (ans_value == '1') ques_result = true; // Easter egg
	if (ans_value == '0') ques_result = false;


	if (ques_result) { // Resposta correcta:

		$('#id_div_respostes')
			.css('background-color', '#00ff00')
			.animate({backgroundColor: col_ori}, 200, 'swing', correct_answer);

	} else { // Resposta incorrecta:

		$('#id_div_respostes')
			.css('background-color', '#ff0000')
			.animate({backgroundColor: col_ori}, 200, 'swing', incorrect_answer);
	}

}


/******************************************************************************/
/* Funció a executar si la resposta és correcte                               */
/******************************************************************************/
function correct_answer() {

	if (play_words[num_quest].play_attempts == 0) anotar_resultat(play_words[num_quest].sheet_row, true);  // Anotar resultat al Sheet (a google Docs)

	$('#id_word_list tbody tr:eq(' + num_quest + ')').css('background-color', '#44ff44');  // Marcar la paraula de la llista en verd
	play_words[num_quest].play_res_ok = 1;
	play_words[num_quest].play_attempts++;
	next_question();
	actualitzar_marcador();
	$('#id_resposta').css('background-color', '#ffffff');
}


/******************************************************************************/
/* Funció a executar si la resposta NO és correcte                             */
/******************************************************************************/
function incorrect_answer() {

	$('#id_word_list tbody tr:eq(' + num_quest + ')').css('background-color', '#ff4444');  // Marcar la paraula de la llista en vermell
	$('#id_resposta').css('background-color', 'red').select();
	actualitzar_marcador();
}


/******************************************************************************/
/* Funció per passar a següent pregunta quan no se sap la resposta,           */
/* marcant-la com a erronia i mostrant el resultat                            */
/******************************************************************************/
function answer_skip() {

	if (play_words[num_quest].play_attempts == 0) anotar_resultat(play_words[num_quest].sheet_row, false);  // Anotar resultat al Sheet (a google Docs)

	alert(play_words[num_quest].word + ' --> ' + play_words[num_quest].meaning);

	$('#id_word_list tbody tr:eq(' + num_quest + ')').css('background-color', '#ff4444'); // Marcar la paraula de la llista en vermell
	play_words[num_quest].play_attempts++;
	actualitzar_marcador();
	next_question();
}


/******************************************************************************/
/* Funció per controlar el que s'escriu com a resposta                        */
/******************************************************************************/
function answer_key_pres(ev) {
	$('#id_resposta').css('background-color', 'white');
	if (ev.keyCode == 13) {
		if ( $('#id_resposta').val() == '') answer_skip();
		else 								test_answer();
	}
}


/******************************************************************************/
/* Funció per visualitzar la següent pregunta                                 */
/******************************************************************************/
function preparar_pregunta() {
	$('#id_word').text((num_quest + 1) + ' - ' + play_words[num_quest].word);
	$('#id_kind_word').text((num_quest + 1) + ' - ' + play_words[num_quest].tipus);
	$('#id_resposta').css('background-color', 'white').val('').focus();
	$('#id_word_list tbody tr:eq(' + num_quest + ')').css('border', '3px solid yellow');
	$('#id_word_list tbody tr:eq(' + num_quest + ') td:first').css('background-color', 'yellow');  // Marcar la paraula de la llista en groc
}


/******************************************************************************/
/* Funció per visualitzar valors del comptador                                */
/******************************************************************************/
function actualitzar_marcador() {
	var total_attempts = 0;
	var total_res_ok = 0;

	for (var t = 0; t < play_words.length; t++) {
		total_attempts += play_words[t].play_attempts;
		total_res_ok += play_words[t].play_res_ok;
	}

	$('#id_scores > span:first')
	  .text('Words left: ' + (play_words.length - total_res_ok)
	               + ' / ' + play_words.length)
	  .next().text('Attempts: ' + total_attempts)
	  .next().text('Hits: '     + total_res_ok)
	  .next().text('Errors: '   + (total_attempts - total_res_ok));
}

/******************************************************************************/
/* Funció de interval per                                                     */
/******************************************************************************/
function Temporitzador(fn, time) {
	var timer = false;

	this.start = function () {
		if (!this.isRunning()) timer = setInterval(fn, time);
	};

	this.stop = function () {
		clearInterval(timer);
		timer = false;
	};

	this.isRunning = function () {
		return timer !== false;
	};
}

function fun_timer_loading() {
	$('#id_titol_joc').text($('#id_titol_joc').text() + '.');
	if ($('#id_titol_joc').text().length > 40) $('#id_titol_joc').text('Loading');
}
