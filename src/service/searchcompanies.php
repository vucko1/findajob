<?php
require_once('./contracts/user.php');
require_once('./contracts/company.php');
include('./helpers/db.php');

session_start();
$user = $_SESSION["user"];

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	
	$array = array();
	
	$filterName = '';
	
	if (isset($_GET['filter'])) {
		$filterName = $_GET['filter'];
	}
	
	$filterName = "%" . $filterName . "%";
	
	$db = connect();

	// echo $filterName;
	// exit;
	$query = $db->prepare("SELECT c.*, ( SELECT COUNT(*) FROM job j WHERE j.company_id = c.id ) AS 'noOfJobOpenings' FROM company c WHERE c.name LIKE ? OR c.orientation LIKE ?");
	
	$query->bind_param('ss', $filterName, $filterName);
	
	$query->execute();	
	$query->store_result();
	
	$query->bind_result($id, $name, $place, $orientation, $description, $noOfEmployees, $noOfJobOpenings);
	
	while ($r = $query->fetch()) {
		$company = new Company();
		
		$company->id = $id;
		$company->name = $name;
		$company->place = $place;
		$company->orientation = $orientation;
		$company->description = $description;
		$company->noOfEmployees = $noOfEmployees;
		$company->noOfJobOpenings = $noOfJobOpenings;
		
		array_push($array, get_object_vars($company));
	}
		
	$query->close();
	mysqli_close($db);
	
	$json = json_encode($array);
	echo $json;
}

?>