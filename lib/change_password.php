<?php
header('Content-Type: application/json');
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
//require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';

switch ($_POST['option']) {
    case 1:
        change_password($dbh,$table_prefix);
        break;
	case 2:
		send_email($dbh,$table_prefix, $domain, $subdomain);
		break;
}

//function for changing the password
function change_password($dbh1, $table_prefix1){
	   // Create salted password (Careful not to over season)
		if (strcmp($_POST['new_pass_enc'], $_POST['new_pass_enc2']) !== 0){
			$array['status'] = 'error';
			$array['message'] = "Heslá sa nezhodujú";
		}else{
			$random_salt = hash('sha512', uniqid(mt_rand(1, mt_getrandmax()), true));
			$password1 = hash('sha512', $_POST['new_pass_enc'].$random_salt);
			if ($stmt =	$dbh1->prepare("SELECT user_id FROM ".$table_prefix1."_password_reset WHERE hash = ? LIMIT 1")){
				$stmt->bindParam(1,$_POST['string']);
				$stmt->execute();
				$stmt->result=$stmt->fetch();
				if ($insert_stmt = $dbh1->prepare("UPDATE ".$table_prefix1."_users SET password=?, salt=? WHERE id=?")) {    
					$insert_stmt->bindParam(1, $password1);
					$insert_stmt->bindParam(2, $random_salt);
					$insert_stmt->bindParam(3, $stmt->result['user_id']);
					$insert_stmt->execute();
					$array['status'] = 'success';
					$array['message'] = "Heslo bolo úspešne zmenené";
					
					if ($select_stmt = $dbh1->prepare("DELETE FROM ".$table_prefix1."_password_reset WHERE hash=?")) {    
						$select_stmt->bindValue(1, $_POST['string']);
						$select_stmt->execute();
					}
				}else{
					$array['status'] = 'error';
					$array['message'] = "Pri ukladaní údajov sa vyskytla chyba";
				}
			}else{
				$array['status'] = 'error';
				$array['message'] = "Pri zmene hesla sa vyskytla chyba. Odkaz nie je platný";
			}
		}
	echo json_encode($array);
}

//function for sending a recovery mail
function send_email($dbh,$table_prefix, $domain, $subdomain){
	$mail = $_POST['mail'];
	$username = $_POST['username'];
	if ($stmt =	$dbh->prepare("SELECT id FROM ".$table_prefix."_users WHERE username = ? AND e_mail = ? LIMIT 1")){
		$stmt->bindParam(1,$username);
		$stmt->bindParam(2,$mail);
		$stmt->execute();
		$stmt->result=$stmt->fetch();
		if ($stmt->rowCount() == 1){
			$id = $stmt->result['id'];
			//create a unique hash for the password recovery 
			$hash = hash('sha512', $username.$mail.$id.time());
			// If a user has already requested a password reset than delete the previous entry so only the last e-mail will be valid
			if ($select_stmt = $dbh->prepare("DELETE FROM ".$table_prefix."_password_reset WHERE user_id = ?")) {    
				$select_stmt->bindValue(1, $id);
				$select_stmt->execute();
			}
			// Add entry with the sent hash for the password reset
			if ($insert_stmt = $dbh->prepare("INSERT INTO ".$table_prefix."_password_reset (user_id, hash) VALUES (?, ?)")) {    
				$insert_stmt->bindParam(1, $id);
				$insert_stmt->bindParam(2, $hash);
				$insert_stmt->execute();
				//send the e-mail
				$to      = $mail;
				$subject = "Zabudnuté heslo - Funduj.sk";
				$message = "Vážený klient,\n\n Pre obnovu Vášho hesla použite nasledovný odkaz: \n http://".$subdomain."?opt=lost_pwd&dlksje=".$hash."\n\n Odkaz je platný nasledovných 24 hodín \n S pozdravom \n Funduj team";
				$headers = 'From: Funduj.sk <admin@'.$domain.'>'."\r\n" .
				'Reply-To: admin@'.$domain."\r\n" .
				'X-Mailer: PHP/' . phpversion();
				// check if the mail is correctly sent
				if(mail($to, $subject, $message, $headers)){
					$array['status'] = 'success';
					$array['message'] = "Na zadanú e-mailovú adresu bol odoslaný e-mail s pokynmi pre obnovu hesla. ";
				}else{
					$array['status'] = 'error';
					$array['message'] = "Pri odosielani správy sa vyskytla chyba";
				}
			}else{
				$array['status'] = 'error';
				$array['message'] = "Pri ukladaní údajov sa vyskytla chyba. Prosíme skúste znovu neskôr.";
			}
		}else{
			$array['status'] = 'error';
			$array['message'] = "Používateľ so zadanými údajmi neexistuje";
		}
	}
	//return the result message to jquery 
	echo json_encode($array);
}
?>