<?php
require_once('service/contracts/user.php');

session_start();
if(!isset($_SESSION['user'])){
	header("location: ./login.php"); // redirect to index if user is already logged in
	exit;
}
else {
	$user = $_SESSION['user'];
}

?>

<!DOCTYPE html>
<head>

    <title>Find a Job - job openings</title>
    <script src="https://use.fontawesome.com/853d20610c.js"></script>

    <!--SHARED STYLES-->
    <link href="css/nav.css" rel="stylesheet" />
    <link href="css/grid-view.css" rel="stylesheet" />
    <link href="css/fj-common.css" rel="stylesheet" />

    <!--FJ LIBRARY AND DEPENDENCIES-->
    <script src="js/main.js" type="text/javascript"></script>
    <script src="js/fj-library/fj-global-actions.js" type="text/javascript"></script>
    <script src="js/fj-library/fj-resources.js" type="text/javascript"></script>
    <script src="js/fj-library/fj-lib-main.js" type="text/javascript"></script>
    <script src="js/fj-library/fj-navigation.js" type="text/javascript"></script>
    <script src="js/fj-library/fj-http.js" type="text/javascript"></script>
	
	<!--DAL-->
	<script src="js/dal/user-dal.js" type="text/javascript"></script>
	<script src="js/dal/company-dal.js" type="text/javascript"></script>
	
    <!--JOB OPENINGS PAGE-->
    <link href="css/user/jobopenings.css" rel="stylesheet" />
    
    <!--USER PROFILE PAGE-->
    <link href="css/user/profile.css" rel="stylesheet" />
    <script src="js/user/profile-vm.js" type="text/javascript"></script>
    
    <!--COMPANIES PAGE-->
    <link href="css/user/companies.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
    <script src="js/user/companies-vm.js" type="text/javascript"></script>
    
</head>
<body>

    <nav class="sidenav">
        <div class="ph-menu-header">
            <div class="ph-menu-page-title">Find a job - Search companies</div>
            <div class="ph-menu-collapse-expand" onclick="collapseExpand();"><i aria-hidden="true" class="fa fa-lg fa-bars"></i></div>
        </div>

        <div class="userinfo">
            <img src="<?php echo $user->profilepicture ?>" class="userimage img-circle" alt="Profile picture" />
            <span class="username">
				<?php 
					echo $user->firstname . ' ' . $user->lastname
				?>
			</span>
        </div>

        <ul class="menu-list" data-expanded="false" >
            <li id="menu-list-profile" onclick="FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.User.Profile)"><i class="fa fa-user" aria-hidden="true"></i>My profile</li>
			
			<?php
			
				if ($user->is_company) {
					echo "<li id='menu-list-mycompany' onclick='FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.Company.MyCompany)'><i class='fa fa-info-circle' aria-hidden='true'></i>My company</li>";
					echo "<li id='menu-list-newjob' onclick='FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.Company.NewJob)'><i class='fa fa-file-text' aria-hidden='true'></i>New Job</li>";
					echo "<li id='menu-list-myjobs' onclick='FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.Company.MyJobs)'><i class='fa fa-list-alt' aria-hidden='true'></i>My jobs</li>";
				}
			?>
            <li id="menu-list-jobopenings" onclick="FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.User.JobOpenings)"><i class="fa fa-briefcase" aria-hidden="true"></i>Job openings</li>
            <li id="menu-list-companies" onclick="FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.User.Companies)"><i class="fa fa-briefcase" aria-hidden="true"></i>Search companies</li>
            <li id="menu-list-bookmarks" onclick="FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.User.Bookmarks)"><i class="fa fa-star" aria-hidden="true"></i>Bookmarks</li>
            <li id="menu-list-logout" onclick="logout()"><i class="fa fa-sign-out" aria-hidden="true"></i>Log out</li>
        </ul>
    </nav>

    <div class="container" id="container-partial-view">

    </div>
    
	<input type="hidden" id="default-opened-site" value="<?php echo $user->is_company ?>" />
</body>