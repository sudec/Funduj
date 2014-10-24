<?php 
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');

	   $username = $_POST['user_name_reg'];
	   $password = $_POST['pass']; // The hashed password.
	   $email = $_POST['email_reg'];
	   $date = date('Y-m-d H:i:s');
	   $random_salt = hash('sha512', uniqid(mt_rand(1, mt_getrandmax()), true));
	   // Create salted password (Careful not to over season)
	   $password1 = hash('sha512', $password.$random_salt);
	   $query="SELECT * FROM ".$table_prefix."_users WHERE username=?";
	   $confirm_hash=hash('sha512', $password1.$random_salt.$email);
	
	if ($stmt =	$dbh->prepare("SELECT username FROM ".$table_prefix."_users WHERE username = ? LIMIT 1")){
		$stmt->bindParam('1',$username, PDO::PARAM_STR);
		$stmt->execute();
		$stmt->result=$stmt->fetch();
		if($stmt->result!=0){
			header('HTTP/1.1 403 Forbidden');
			exit("Používateľ s týmto menom už existuje");
		}else{
			 if ($insert_stmt = $dbh->prepare("INSERT INTO ".$table_prefix."_users_not_confirmed (username, e_mail, password, salt, member_since, confirm_hash) VALUES (?, ?, ?, ?, ?, ?)")) {    
				  $insert_stmt->bindValue(1, $username);
				  $insert_stmt->bindValue(2, $email);
				  $insert_stmt->bindValue(3, $password1);
				  $insert_stmt->bindValue(4, $random_salt);
				  $insert_stmt->bindValue(5, $date);
				  $insert_stmt->bindValue(6, $confirm_hash);
				  // Execute the prepared query.
				  $insert_stmt->execute();
				  //header('location:'.$_SERVER['DOCUMENT_ROOT'].'/index.php');
				  $last_user_id=$dbh->lastInsertId();
				  mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_user_id."/img",0755);//create image folder for the user
				 	
				 	$to      = $email;
					$subject = "Potvrdenie registrácie - Funduj.sk";
					$message = "Vážený klient,\nĎakujeme že ste sa zaregistrovali na stránke http://funduj.sk \n\nPre aktiváciu Vášho účtu proím použite nasledovný odkaz: http://".$subdomain."/?opt=conf&uiaid=".$confirm_hash."&note=".$last_user_id."\n\nS pozdravom Funduj team.\nTento mail bol odoslaný automaticky ".$date;
					$headers = 'From: Funduj.sk <admin@'.$domain.'>'."\r\n" .
						'Reply-To: admin@'.$domain."\r\n" .
						'X-Mailer: PHP/' . phpversion();
					mail($to, $subject, $message, $headers);
			   }
		}
	}
		
	  
 ?>