<?php

	// $paraula = "hello";
	$paraula = $_REQUEST[paraula];
	$tipus = $_REQUEST[tipus];	// noun / verb / adjective / adverb
	// $url_des = "https://translate.google.com/translate_a/single?client=t&sl=en&tl=es&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&ie=UTF-8&oe=UTF-8&source=bh&ssel=0&tsel=0&kc=1&tk=398444.12423&q=".$paraula;
    $url_des = "https://translate.google.com/translate_a/single?client=t&sl=en&tl=es&hl=ca&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&source=btn&srcrom=1&ssel=5&tsel=5&kc=0&tk=100732.504200&q=";
    $url_des = $url_des.$paraula;
	// $url_des = "https://translate.google.com/gen204?lexicon=dt=cm,sl=en,tl=es,hl=en,q=dog,e=show,md=e,rw=ne,bd=ne,cm=e";
	// $url_des = "https://translate.google.com/?source=gtx#en/es/dog";
	// $url_des = "https://www.google.es";


// --------------- TO SAVE THE RESPONSE URL TO A FILE ----------------------- //
/*
	// $fp = fopen('hook_web.html', 'w');	// echo getcwd(); <- show default dir
	$fp = fopen('/media/DISK4/PROGRAMES_PROPIS/APLICACIONS_WEB/ENG_TEST/hook_web.html', 'w');


    $ch = curl_init($url_des);				// create curl resource

	curl_setopt($ch, CURLOPT_FILE, $fp);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_exec($ch);
	curl_close($ch);

	fclose($fp);
*/
// -------------------------------------------------------------------------- //

// --------------- TO SAVE THE RESPONSE URL TO A VARIABLE ------------------- //


    $ch = curl_init(); 								// create curl resource
    curl_setopt($ch, CURLOPT_URL, $url_des); 		// set url
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 	//return the transfer as a string

    $output = curl_exec($ch);						// $output contains the output string
	$len = strlen($optput);

    curl_close($ch);

	if (strlen($tipus) != 4) $tipus = "xxxx";
	// echo utf8_decode($output);
	echo $tipus.$output;

	// parse_str($output2);

/*

	if ($tipus != "") {
		$pos1 = strpos($output, "\"".$tipus."\"");
		$pos1 = $pos1 + strpos(substr($output, $pos1 + 1), "\"") + 1;
		$pos1 = $pos1 + strpos(substr($output, $pos1 + 1), "\"") + 1;
	} else {
		$pos1 = strpos($output, "\"");
	}

	// $pos1 = $pos1 + strpos(substr($output, $pos1 + 1), "\"") + 1;
	// $pos1 = $pos1 + strpos(substr($output, $pos1 + 1), "\"") + 1;	Descomentar aquestes 2 linies per agafar la 2a opcio

	$pos2 = strpos(substr($output, $pos1 + 1), "\"");
	$tag = substr($output, $pos1 + 1, $pos2);

	$caracters_especials = array("<", ">");

	echo "<html> <body> <p>";
	echo $paraula." = ".$tag;

	// echo "pos1 = " . $pos1 . "<br/>";
	// print_r($resultat['result']);
	// echo $result[3];
	// echo "<br/>";

	// echo "<br/>" . substr($output, $pos1);

	// echo str_replace($caracters_especials, '_', $output);
	// echo str_replace($caracters_especials, '_', $tag);
	echo "</p> </body> </html>";
*/
// -------------------------------------------------------------------------- //


/*


	// echo "doc = " . substr($output, 1, 500);
	$stri = "hola que tal";
	$s = substr($output, 0, 500);
	// echo str_replace('a', 'X', $stri);
// 	echo str_replace('<', '_', $output);




	echo "<html> <body> <p>";
	// echo '<input type="textarea" style="width:800px; height: 400px;" value="';
	echo str_replace($caracters_especials, '_', $output);
	// echo '"/>';
	echo "</p> </body> </html>";


/*
	echo getcwd();

	$ch = curl_init($url_des);

	$fp = fopen("/media/DISK4/PROGRAMES_PROPIS/APLICACIONS_WEB/ENG_TEST/example_homepage.txt", "w");

	curl_setopt($ch, CURLOPT_FILE, $fp);
	curl_setopt($ch, CURLOPT_HEADER, 0);

	curl_exec($ch);
	curl_close($ch);
	fclose($fp);

	$gestor = fopen("example_homepage.txt", "r");
	$lin = fgetc($gestor);
	fclose($gestor);
*/

?>
