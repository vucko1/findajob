<?php
require('./contracts/user.php');
include("./helpers/db.php");

session_start();
$user = $_SESSION["user"];

$db = connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$json = file_get_contents('php://input');
	$data = json_decode($json,false);
	
	
	$query = $db->prepare('INSERT INTO job (company_id, description, title)
							VALUES (?, ?, ?)');
	
	$query->bind_param('iss', $user->company_id, $data->description, $data->title);
	
	$query->execute();
	
	$query->close();
	mysqli_close($db);
}

?>