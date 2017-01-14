<?php
require_once('./contracts/user.php');
require_once('./contracts/userprofile.php');
include('./helpers/db.php');

session_start();
$user = $_SESSION['user'];
	
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
	$json = file_get_contents('php://input');
	$data = json_decode($json,false);
	
	$errors = array();
	
	if (strlen($data->basicInfo->firstName) === 0)
		array_push($errors, 'First name must be at least 1 character long');
	
	if (strlen($data->basicInfo->lastName) === 0)
		array_push($errors, 'Last name must be at least 1 character long');
	
	if (strlen($data->basicInfo->dateOfBirth) === 0)
		array_push($errors, 'Date of birth must be at least 1 character long');
	
	if (strlen($data->basicInfo->email) <= 0)
		array_push($errors, 'Email must be at least 1 character long');
	
	if (preg_match('/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,3}$/', $data->basicInfo->email, $matches, PREG_OFFSET_CAPTURE) === false)
		array_push($errors, 'Email is in invalid format');
	
	if (strlen($data->profession->graduationYear) <= 0)
		array_push($errors, 'Graduation year must be at least 1 character long');
	
	if (strlen($data->profession->status) <= 0)
		array_push($errors, 'Status must be at least 1 character long');
	
	if (strlen($data->profession->profession) <= 0)
		array_push($errors, 'Graduation year must be at least 1 character long');
	
	if (strlen($data->password) <= 0)
		array_push($errors, 'Password must be at least 1 character long');
	
	if (sizeof($errors) > 0) {
		header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
		echo json_encode($errors);
	}
	else {
		$db = connect();
	
		$query = $db->prepare("SELECT password FROM user WHERE id = ?");
		
		$query->bind_param('i', $user->id);
	
		$query->execute();
		$query->store_result();
		
		if ($query->num_rows == 1) {
			
			$query->bind_result($password);
			$query->fetch();
			
			if ($password !== $data->password) {
				header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
				echo json_encode(["Incorrect password"]);
				exit;
			}
			
			if ($data->password !== $data->newPassword && $data->newPassword !== "")
				$data->password = $data->newPassword;
		}
		
		$query = $db->prepare("UPDATE user
								SET firstname = ?,
									lastname = ?,
									password = ?,
									dateofbirth = ?,
									gender = ?,
									country = ?,
									city = ?,
									email = ?,
									profilepicture = ?,
									college = ?,
									graduationyear = ?,
									title = ?,
									status_id = ?,
									profession = ?
								WHERE id = ?");
								
		$query->bind_param('ssssisssssisisi', $data->basicInfo->firstName, $data->basicInfo->lastName, $data->password, $data->basicInfo->dateOfBirth, $data->basicInfo->gender, $data->basicInfo->country, $data->basicInfo->city, $data->basicInfo->email, $data->basicInfo->profilePicture, $data->profession->college, $data->profession->graduationYear, $data->profession->title, $data->profession->status, $data->profession->profession, $user->id);
		
		$status = $query->execute();

		if ($status === false) {
		  trigger_error($query->error, E_USER_ERROR);
		}

		$query->close();
		mysqli_close($db);
	}
}
else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$db = connect();
	
	$query = $db->prepare('SELECT * FROM user WHERE id = ?');
	
	$query->bind_param('s', $user->id);
	
	$query->execute();	
	$query->bind_result($id, $username, $password, $firstname, $lastname, $dateofbirth, $gender, $country, $city, $email, $profilepicture, $college, $graduationyear, $title, $status_id, $profession, $is_admin, $is_company, $company_id);
	
	$query->fetch();
	
	$userprofile = new UserProfile();
	$userprofile->id = $id;
	$userprofile->firstname = $firstname;
	$userprofile->lastname = $lastname;
	$userprofile->dateofbirth = $dateofbirth;
	$userprofile->gender = $gender;
	$userprofile->country = $country;
	$userprofile->city = $city;
	$userprofile->email = $email;
	$userprofile->profilepicture = $profilepicture;
	$userprofile->college = $college;
	$userprofile->graduationyear = $graduationyear;
	$userprofile->title = $title;
	$userprofile->status_id = $status_id;
	$userprofile->profession = $profession;
	$userprofile->is_admin = $is_admin;
	
	$query->close();
	mysqli_close($db);
	
	echo json_encode(get_object_vars($userprofile));
}
?>