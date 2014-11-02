<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/php_iban/php-iban.php';

if(!isset($_GET['option'])){$_GET['option']='0';}
switch ($_POST['option']) {
    case 'send_mail':
        send_mail();
	break;
	case 'check_IBAN':
		check_IBAN($_POST['IBAN']);
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


function check_IBAN($iban){
	$machine_iban = iban_to_machine_format($iban);
	if(verify_iban($machine_iban)) {
	 	$array['result'] = false;
	 	$array['human_IBAN']= iban_to_human_format($machine_iban);
		echo json_encode($array);
	}
	else{
		$array['result'] = true;
		$array['message'] = "Nesprávny iban";  
		echo json_encode($array);
	}
}

?>