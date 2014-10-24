<?php
if(!isset($_GET['option'])){$_GET['option']='0';}
switch ($_POST['option']) {
    case 'send_mail':
        send_mail();
	break;
}

function send_mail(){
$to      = 'info@webvibes.sk';
$subject = $_POST['subject'];
$message = $_POST['message'];
$headers = 'From: ' .$_POST['from']. "\r\n" .
    'Reply-To: '.$_POST['from']."\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);

}
?>