<?php

require_once('../service/contracts/user.php');
include('../service/helpers/db.php');

session_start();
$user = $_SESSION["user"];

$db = connect();

$query = $db->prepare("SELECT j.id, j.description AS 'jobdescription', j.title, c.name
						FROM job j
						INNER JOIN company c ON j.company_id = c.id
						INNER JOIN user_job_favourite uj ON uj.job_id = j.id
						WHERE uj.user_id = ?");

$query->bind_param("i", $user->id);

$query->execute();	
$query->store_result();

$query->bind_result($id, $jobdescription, $title, $name);

echo "<div class='job-cards col col-4'>";

if ($query->num_rows === 0)
	echo "You didn't bookmark any jobs... What are you waiting for? :)";

while ($query->fetch()) {
	echo "<div class='job-card'>

        <div class='job-star fa-stack fa-2x'>
            <i class='fa fa-circle fa-stack-2x circle-background'></i>
            <i class='fa fa-stack-1x starred' onclick='toggleBookmark(" . $id . ", 0, this)'></i>
        </div>

        <div class='job-info'>
            <div class='job-employer'>" . $name . "</div>

            <div class='job-title'>" . $title . "</div>

            <div class='job-description'>" . $jobdescription . "</div>
        </div>

    </div>";
}

echo "</div>";
	
$query->close();
mysqli_close($db);
	
?>