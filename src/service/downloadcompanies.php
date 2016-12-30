<?php

$file='data/companies.xml';

if (file_exists($file)) {
    $xml = simplexml_load_file($file);
    $f = fopen('companies.csv', 'w');

    $headers = array(); 
	
    foreach ($xml->company->children() as $field) { 
        $headers[] = $field->getName(); 
    }
    
	fputcsv($f, $headers, ',', '"');

    foreach ($xml->children() as $information) {
        fputcsv($f, get_object_vars($information));
    }
	
    fclose($f);
	
	header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
	header("Cache-Control: public"); // needed for internet explorer
	header("Content-Type: application/zip");
	header("Content-Transfer-Encoding: Binary");
	header("Content-Length:".filesize('companies.csv'));
	header("Content-Disposition: attachment; filename=companies.csv");
	readfile('companies.csv');
}

?>