<?php
	require_once('../service/contracts/user.php');
	include('../service/helpers/db.php');

	session_start();
	$user = $_SESSION["user"];

	$db = connect();

	$query = $db->prepare("SELECT j.*, ( SELECT COUNT(*) FROM User_job_favourite uj WHERE uj.job_id = j.id ) AS 'popularity' FROM job j WHERE j.company_id = ?");
						   
	$query->bind_param("i", $user->company_id);

	$query->execute();	
	$query->store_result();

	$query->bind_result($id, $company_id, $description, $title, $popularity);

	echo "<div class='col col-4'>
			<table id='companies'>
				<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Times bookmarked (popularity)</th>
					<th>Delete job</th>
				</tr>
			</thead>
			<tbody>";

	while ($query->fetch()) {
		echo "<tr>
				<td>" . $title . "</td>
				<td>" . $description . "</td>
				<td>" . $popularity . "</td>
				<td style='text-align:center'><i class='fa fa-trash-o' aria-hidden='true' onclick='deleteJob(" . $id . ")'></i></td>
			  </tr>";
	}

	echo "</tbody>
		</table>
	</div>";
		
	$query->close();
	mysqli_close($db);
?>