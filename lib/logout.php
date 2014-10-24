<?php 
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/session.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/classes/admins.class.php');
//require_once($_SERVER['DOCUMENT_ROOT'].'/config.php');
sec_session_start();
// Unset all session values
$_SESSION = array();
// get session parameters 
$params = session_get_cookie_params();
// Delete the actual cookie.
setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
// Destroy session
session_destroy();
header('Location: ../');
?>