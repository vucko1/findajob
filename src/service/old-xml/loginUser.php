<?php
function connect($table) {
    $c = mysqli_connect("localhost:3306", "root", "", "fj");
    return $c;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	
	if ($error !== "" && empty($_POST['username']))
		$error = "Username is not supplied.";
	
	if ($error !== "" && empty($_POST['password']))
		$error = "Password is not supplied.";
	
	$db = connect("user");
	
	// trim username and password
	$username = stripslashes($_POST['username']);
	$password = stripslashes($_POST['password']);
	
	$query = $db->prepare('SELECT id, firstname, lastname, profilepicture, is_admin FROM user WHERE username = ? AND password = ?');
	
	$query->bind_param('ss', $username, $password);
	
	$query->execute();
	$query->store_result();
	
	if ($query->num_rows == 1) {
		
		$query->bind_result($id, $firstname, $lastname, $profilepicture, $is_admin);
		$query->fetch();
		
		$user = new User();
		$user->id = $id;
		$user->username = $username;
		$user->firstname = $firstname;
		$user->lastname = $lastname;
		$user->profilepicture = $profilepicture;
		$user->is_admin = $is_admin;
		
		session_start(); 
		$_SESSION['user'] = $user;
		header("location: ./index.php"); // redirect
		exit;
	}
	else {
		$error = "Username and password are incorrect";
	}
	
	$query->close();
	mysqli_close($db);
}

?>
