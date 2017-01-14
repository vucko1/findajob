<?php

function assocArrayToXML($root_element_name,$ar)
{
    $xml = new SimpleXMLElement("<?xml version=\"1.0\"?><{$root_element_name}></{$root_element_name}>");
    $f = function($f,$c,$a) {
            foreach($a as $k=>$v) {
                if(is_array($v)) {
                    $ch=$c->addChild($k);
                    $f($f,$ch,$v);
                } else {
                    $c->addChild($k,$v);
                }
            }
    };
    $f($f,$xml,$ar);
    return $xml->asXML();
} 


if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
	
	$json = file_get_contents('php://input');
	$data = json_decode($json,true);

	$xml = simplexml_load_string(assocArrayToXML("root",$data));
	
	$errors = array();
	
	if (strlen($xml->basicInfo->firstName) === 0)
		array_push($errors, 'First name must be at least 1 character long');
	
	if (strlen($xml->basicInfo->lastName) === 0)
		array_push($errors, 'Last name must be at least 1 character long');
	
	if (strlen($xml->basicInfo->dateOfBirth) === 0)
		array_push($errors, 'Date of birth must be at least 1 character long');
	
	if (strlen($xml->basicInfo->email) <= 0)
		array_push($errors, 'Email must be at least 1 character long');
	
	if (preg_match('/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/', $xml->basicInfo->email, $matches, PREG_OFFSET_CAPTURE) === false)
		array_push($errors, 'Email is in invalid format');
	
	if (strlen($xml->profession->graduationYear) <= 0)
		array_push($errors, 'Graduation year must be at least 1 character long');
	
	if (strlen($xml->profession->status) <= 0)
		array_push($errors, 'Status must be at least 1 character long');
	
	if (strlen($xml->profession->profession) <= 0)
		array_push($errors, 'Graduation year must be at least 1 character long');
	
	if (strlen($xml->password) <= 0)
		array_push($errors, 'Password must be at least 1 character long');
	
	if (sizeof($errors) > 0) {
		header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
		echo json_encode($errors);
	}
	else {
		$xml->asXml('data/userdata.xml');
		echo "ok";
	}
}
else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$xml = simplexml_load_file("data/userdata.xml");
	$json = json_encode($xml);
	echo $json;
}

?>