<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/login.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();

if(isset($_POST['login_user_name'], $_POST['p'])) { 
   $username = $_POST['login_user_name'];
   $password = $_POST['p']; // The hashed password.

   if(login($username, $password, $dbh) == true) {
      // Login success
	   header('Location:../');
   } else {
      // Login failed
		header('HTTP/1.1 403 Forbidden');
		exit("Nesprávne meno alebo heslo");
   }
} else { 
   // The correct POST variables were not sent to this page.
   echo 'Invalid Request';
}
 ?>
