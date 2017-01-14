<?php
require('../service/contracts/user.php');
include("../service/helpers/db.php");

session_start();
$user = $_SESSION["user"];

$db = connect();

$id = $name = $place = $orientation = $description = $noofemployees = "";

$query = $db->prepare('SELECT * FROM company WHERE id = ?');

$query->bind_param('i', $user->company_id);

$query->execute();
$query->store_result();

if ($query->num_rows == 1) {
	$query->bind_result($id, $name, $place, $orientation, $description, $noofemployees);
	$query->fetch();
}

$query->close();
mysqli_close($db);
?>

<div class="profile-containers">
	<div class="profile-basicinfo profile-container">
        <div class="profile-container-title">Basic info</div>

        <div class="profile-container-content">

            <div class="col col-2 labels">
                <div class="required-field">Company name </div>
                <div class="required-field">Place </div>
                <div class="required-field">Orientation </div>
				<div class="required-field">Description </div>
                <div class="required-field">Number of employees </div>
            </div>

            <div class="col col-2 inputs">
				<input class="profile-control" name="name" type="text" id="pc-name" value="<?php echo $name ?>" />
				<input class="profile-control" name="place" type="text" id="pc-place" value="<?php echo $place ?>" />
				<input class="profile-control" name="orientation" type="text" id="pc-orientation" value="<?php echo $orientation ?>" />
				<input class="profile-control" name="description" type="text" id="pc-description" value="<?php echo $description ?>" />
				<input class="profile-control" name="noofemployees" type="text" id="pc-noofemployees" value="<?php echo $noofemployees ?>" />
				
            </div>
        </div>
    </div>	
</div>

<button class="fj-button save-user-button" style="margin-left: 45%" onclick="saveCompany()">Save</button>