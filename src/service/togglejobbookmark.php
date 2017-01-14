<?php
require_once('./contracts/user.php');
require_once('./contracts/userprofile.php');
include('./helpers/db.php');

session_start();
$user = $_SESSION['user'];
	
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
	$json = file_get_contents('php://input');
	$data = json_decode($json,false);
	
	$db = connect();

	$sql = "";
	
	if ($data->action === 1)
		$sql = "INSERT INTO user_job_favourite (user_id, job_id) VALUES (?, ?)";
	else
		$sql = "DELETE FROM user_job_favourite WHERE user_id = ? AND job_id = ?";
	
	$query = $db->prepare($sql);

	$query->bind_param('ii', $user->id, $data->job_id);

	$query->execute();

	$query->close();
	mysqli_close($db);
}