<?php
require_once('./contracts/user.php');
require_once('./contracts/userprofile.php');
include('./helpers/db.php');

session_start();
$user = $_SESSION['user'];
	
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$db = connect();

	$query = $db->prepare("DELETE FROM user_job_favourite WHERE job_id = ?");
	$query->bind_param('i', $_GET["id"]);
	$query->execute();

	$query = $db->prepare("DELETE FROM job WHERE id = ?");
	$query->bind_param('i', $_GET["id"]);
	$query->execute();
	
	$query->close();
	mysqli_close($db);
}