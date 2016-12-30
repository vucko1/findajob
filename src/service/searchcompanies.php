<?php

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$xml = simplexml_load_file("data/companies.xml");
	
	$array = array();
	
	$filterName = '';
	
	if (isset($_GET['filter'])) {
		$filterName = $_GET['filter'];
	}
	
	foreach ($xml->children() as $company) {
		if ($filterName === '' || stripos($company->name, $filterName) !== false || stripos($company->orientation, $filterName) !== false)
			array_push($array, $company);
	}
	
	$json = json_encode(array_values($array));
	echo $json;
}

?>