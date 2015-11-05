function doGet(e) {
  var template = HtmlService.createTemplateFromFile('Index');

  // Build and return HTML in IFRAME sandbox mode.
  return template.evaluate()
      .setTitle('English Test Joel Web App')
      .setSandboxMode(HtmlService.SandboxMode.IFRAME);
}


function macro_llegir_doc(id_doc) {

  var max_got = 30;  // <---- Número de paraules a seleccionar per cada partida
  var contents = [];

  var ss = SpreadsheetApp.openById(id_doc);
  var sheet = ss.getSheets()[0];
  var data = sheet.getDataRange().getValues();

  var desordenar = true;

  if (data[0][0] == 'random=no')  desordenar = false;

  for (var i = 1; i < data.length; i++) {
    if (data[i][0] != '') {
      contents.push({ word:            data[i][0],
                      tipus:           data[i][1],
                      meaning:         data[i][2],
                      sheet_row:       i + 1,
                      total_attempts:  data[i][5],
                      total_res_ok:    data[i][6],
                      total_skip:      data[i][7],
                      play_attempts:   0,
                      play_res_ok:     0,
                      select_score:    data[i][9],
                      random_order:    Math.floor(Math.random() * 100)
                    });
    }
  }

  contents = contents.sort(function(a, b) {
    if ((b.select_score > a.select_score)
        || (    (b.select_score == a.select_score)
      && (b.random_order > a.random_order)
      )
      ) { return 1; }
    else { return -1; }
  });

  sheet.getRange(2, 6, contents.length - 1, 4).setBackground('white'); // Pintar tot blanc

  // Seleccionar la columna de skip count, i sumar-li 1 a tots
  var range = sheet.getRange(2, 9, contents.length, 1);
  var array_col = range.getValues();

  for (var t = 0; t < range.getNumRows(); t++) array_col[t][0]++;  // Add +1 to all skip count
  range.setValues(array_col);

  contents = contents.slice(0, max_got); // Elimina els restants (no seleccionats)

  // Marcar en groc els seleccionats (en realitat això no cal)
  for (var t = 0; t < contents.length; t++) {
    sheet.getRange('I' + contents[t].sheet_row).setBackground('yellow'); // Selected words
  }

  return contents;
}


function macro_anotar_resultat(id_doc, sheet_row, result) {
  var contents = {
      children: []
  };

  var ss = SpreadsheetApp.openById(id_doc);
  var sheet = ss.getSheets()[0];

  // Recuperar la fila a modificar
  var range = sheet.getRange(sheet_row, 6, 1, 4);
  var array_col = range.getValues();

  array_col[0][0]++;    // Add +1 num attempts (F)
  array_col[0][3] = ''; // Reset skip count (I)

  if (result) {
    array_col[0][1]++; // Add +1 num hits OK (G)
    array_col[0][2]++; // Add +1 num hits OK consecutive (H)
    range.setBackground('green');
  } else {
    array_col[0][2] = ''; // Reset num hits OK consecutive (H)
    range.setBackground('red');
  }

  range.setValues(array_col);

  return contents;
}
