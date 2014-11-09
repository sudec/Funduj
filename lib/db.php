<?php 
// Adding a test comments
//include($_SERVER['DOCUMENT_ROOT'].'/adodb/adodb.inc.php');
include($_SERVER['DOCUMENT_ROOT'].'/classes/db.class.php');
include($_SERVER['DOCUMENT_ROOT'].'/config.php');
$dbh = new database($db_server, $db_user, $db_pass, $db_select);
 ?>