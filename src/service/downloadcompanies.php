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
}

?>