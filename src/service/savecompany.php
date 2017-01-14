<?php
require('./contracts/user.php');
include("./helpers/db.php");

session_start();
$user = $_SESSION["user"];

$db = connect();

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
	$json = file_get_contents('php://input');
	$data = json_decode($json,false);
	
	
	$query = $db->prepare('UPDATE company
							SET name = ?,
								place = ?,
								orientation = ?,
								description = ?,
								noofemployees = ?
							WHERE id = ?');
	
	$query->bind_param('sssssi', $data->name, $data->place, $data->orientation, $data->description, $data->noofemployees, $user->company_id);
	
	$query->execute();
	
	$query->close();
	mysqli_close($db);
}

?>