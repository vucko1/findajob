<?php

require_once('../service/contracts/user.php');
include('../service/helpers/db.php');

session_start();
$user = $_SESSION["user"];

$db = connect();

$query = $db->prepare("SELECT j.id, j.description AS 'jobdescription', j.title, c.name, EXISTS (SELECT * FROM user_job_favourite uj WHERE uj.user_id = ? AND uj.job_id = j.id) AS 'Bookmarked'
FROM Job j
INNER JOIN company c ON j.company_id = c.id");
					   
$query->bind_param("i", $user->id);

$query->execute();	
$query->store_result();

$query->bind_result($id, $jobdescription, $title, $name, $bookmarked);

echo "<div class='job-cards col col-4'>";

while ($query->fetch()) {
	echo "<div class='job-card'>

        <div class='job-star fa-stack fa-2x'>
            <i class='fa fa-circle fa-stack-2x circle-background'></i>
            <i class='fa fa-stack-1x " . ($bookmarked == 1 ? "" : "not-" ). "starred' onclick='toggleBookmark(" . $id . ", " . ($bookmarked == 1 ? 0 : 1) . ", this)'></i>
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