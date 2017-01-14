<?php

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$xml = simplexml_load_file("data/companies.xml");
	$json = json_encode($xml);
	echo $json;
}

?>