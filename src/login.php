<?php
require_once('service/contracts/user.php');
include('service/loginUser.php');

session_start();

if (isset($_SESSION['user'])) {
	header("location: ./index.php"); // redirect to index if user is already logged in
	exit;
}

?>
<!DOCTYPE html>
<head>

    <title>Find a Job - Login</title>
    <script src="https://use.fontawesome.com/853d20610c.js"></script>

    <link href="css/login.css" rel="stylesheet" />
    <link href="css/fj-common.css" rel="stylesheet" />
    
    <script src="js/fj-library/fj-global-actions.js" type="application/javascript"></script>
    <script src="js/fj-library/fj-lib-main.js" type="text/javascript"></script>
    <script src="js/login/login-vm.js"></script>
</head>
<body>
    <div id="login-wrapper">
        <div id="login-label">
            Login
        </div>
		<form action="" method="POST">
		
			<div id="login-info">
				<div id="login-username">
					<span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
					<input type="text" placeholder="Username" id="login-username-input" name="username" />
				</div>

				<div id="login-password">
					<span class="icon"><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" placeholder="Password" id="login-password-input" name="password" />
				</div>

				<div id="remember-me-wrapper">
					<input type="checkbox" id="remember-me-checkbox" /> Remember me
				</div>
			</div>
        
			<div id="login-button">
				<button name="submit" class="fj-button">Login</button>
			</div>
		</form>
		<?php echo $error; ?>
    </div>
</body>