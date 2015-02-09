<?php 
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();

if (isset($_POST['action']) && $_POST['action']=='login'){
	if(isset($_POST['login_user_name'], $_POST['p'])) { 
		   $username = $_POST['login_user_name'];
		   $password = $_POST['p']; // The hashed password.
		   if(login($username, $password, $dbh) == true) {
			  // Login success
			   echo("Uspesne prihlasenie. Budete presmerovany na uvodnu stranku.");   
		   } else {
			  // Login failed
				header('HTTP/1.1 403 Forbidden');
				exit("Nesprávne meno alebo heslo");
		   }
	} else { 
		   // The correct POST variables were not sent to this page.
			header('HTTP/1.1 403 Forbidden');
			exit("Vyplnte meno alebo heslo");
	}
}


function login($user, $pass, $dbh) {

	global $table_prefix;
	include $_SERVER['DOCUMENT_ROOT'].'/config.php';
	if ($stmt =	$dbh->prepare("SELECT id, username, password, salt FROM ".$table_prefix."_users WHERE username = ? LIMIT 1")){
		$stmt->bindParam('1',$user, PDO::PARAM_STR);
		$stmt->execute();
		$stmt->result=$stmt->fetch();
		$id=$stmt->result['id'];
		//has the typed password with the salt from the databe and compare with the one in the database
	    $password = hash('sha512', $pass.$stmt->result['salt']);
	    if ($stmt->rowCount() == 1){
			
	    	if (checkbrute($id,$dbh)==true){
	    		echo ("Váš účet bol zablokovaný z dôvodu viacerých nesprávnych prihlásení.");
				header('HTTP/1.1 401 Unauthorized', true, 401);
				return false;
	    	}
	    	else{
	    		if($stmt->result['password'] == $password) { // Check if the password in the database matches the password the user submitted. 
		            // Password is correct!
		 
		 
		               $user_browser = $_SERVER['HTTP_USER_AGENT']; // Get the user-agent string of the user.
		 
		               $user_id = preg_replace("/[^0-9]+/", "",  $stmt->result['id']); // XSS protection as we might print this value
		               $_SESSION['user_id'] = $user_id; 
		               $username = preg_replace("/[^a-zA-Z0-9_\-]+/", "",  $stmt->result['username']); // XSS protection as we might print this value
		               $_SESSION['username'] = $username;
		               $_SESSION['login_string'] = hash('sha512', $password.$user_browser);
		               $clear_log_attempt = $dbh->prepare("DELETE FROM ".$table_prefix."_users_login_attempts WHERE user_id = ?");
		               $clear_log_attempt->bindValue(1, $id);
		               $clear_log_attempt->execute();
		               // Login successful.
		               return true;    
		         } else {
		            // Password is not correct
		            // We record this attempt in the database
		            $now = time();
		            $dbh->query("INSERT INTO ".$table_prefix."_users_login_attempts (user_id, time) VALUES ('$id', '$now')");
		            return false;
		         }
	    	}
	    }
	    else{
	    	echo ("");
			return false;
	    }
 	}
}


function checkbrute($user_id, $mysql) {
	global $table_prefix;
   // Get timestamp of current time
   $now = time();
   // All login attempts are counted from the past 2 hours. 
   $valid_attempts = $now - (2 * 60 * 60); 
 
   if ($stmt = $mysql->prepare("SELECT time FROM ".$table_prefix."_users_login_attempts WHERE user_id = :user AND time > '$valid_attempts'")) { 
      $stmt->bindParam(':user',$user_id, PDO::PARAM_STR); 
      // Execute the prepared query.
      $stmt->execute();
      $stmt->result=$stmt->fetchAll();
      $stmt->rowCount();
      // If there has been more than 5 failed logins
      if($stmt->rowCount() > 5) {
         return true;
      } else {
         return false;
      }
   }
}

function login_check($mysqli) {
  global $table_prefix;
   // Check if all session variables are set
   if(isset($_SESSION['user_id'], $_SESSION['username'], $_SESSION['login_string']) || isset($_SESSION['user_id'], $_SESSION['username'], $_SESSION['FB_id'])) {
	 $user_id = $_SESSION['user_id'];
     $login_string = $_SESSION['login_string'];
     $username = $_SESSION['username'];
     
     if(isset($_SESSION['FB_id'])){
	 	$FB_id=$_SESSION['FB_id'];
 	 }
     $user_browser = $_SERVER['HTTP_USER_AGENT']; // Get the user-agent string of the user.
 
     if ($stmt = $mysqli->prepare("SELECT password, id, FB_id FROM ".$table_prefix."_users WHERE id = ? LIMIT 1")) { 
        $stmt->bindValue(1, $user_id); // Bind "$user_id" to parameter.
        $stmt->execute(); // Execute the prepared query.
 
        if($stmt->rowCount() == 1) { // If the user exists
           $stmt->result=$stmt->fetch();
           $login_check = hash('sha512', $stmt->result['password'].$user_browser);
           if($login_check == $login_string) {
              // Logged In!!!!
              return true;
           } elseif($stmt->result['FB_id']==$FB_id){
			   // Logged In!!!!
			   return true;
		   } else {
              // Not logged in
              return false;
           }
        } else {
            // Not logged in
            return false;
        }
     } else {
        // Not logged in
        return false;
     }
   } else{
     // Not logged in
     return false;
   }
}


//Next part ensures FB login is user has not previously connected with facebook
if (isset($_POST['fb_register'])){
	   echo "FB logoin";
		if ($stmt =	$dbh->prepare("SELECT id, name, last_name FROM ".$table_prefix."_users WHERE FB_id = ? LIMIT 1")){//select user with appropriate FB id
			$stmt->bindParam('1',$_POST['id'], PDO::PARAM_STR);
			$stmt->execute();
			$stmt->result=$stmt->fetch();
			$id=$stmt->result['id'];

			if ($stmt->rowCount() == 1){
				//user already loged in with facebook previously
					echo ("user exists");
			}else{
				$date = date('Y-m-d H:i:s');
				//this is the first time the user logs in with facebook
				// Store all data to db and create a new user
				if ($stmt =	$dbh->prepare("INSERT INTO ".$table_prefix."_users (name, last_name, e_mail, member_since, FB_id) VALUES (?, ?, ?, ?, ?)")){//select user with appropriate FB id
					$stmt->bindValue(1,$_POST['first_name']);
					$stmt->bindValue(2,$_POST['last_name']);
					$stmt->bindValue(3,$_POST['email']);
					$stmt->bindValue(4,$date);
					$stmt->bindValue(5,$_POST['id']);
					$stmt->execute();
					$last_user_id=$dbh->lastInsertId();
					echo "last inserted id: ".$last_user_id;
					mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_user_id."/img",0755);//create image folder for the user
					$_SESSION['user_id']=$last_user_id;
					$_SESSION['username']=$_POST['first_name']." ".$_POST['last_name'];
					$_SESSION['FB_id']=$_POST['id'];
					login_check($dbh);
				}
			}
		}
}

if (isset($_POST['fb_login'])){
	echo "fb login";
	if ($stmt =	$dbh->prepare("SELECT id, name, last_name FROM ".$table_prefix."_users WHERE FB_id = ? LIMIT 1")){//select user with appropriate FB id
			$stmt->bindParam('1',$_POST['id'], PDO::PARAM_STR);
			$stmt->execute();
			$stmt->result=$stmt->fetch();

			if ($stmt->rowCount() == 1){
				//user already loged in with facebook previously
				$_SESSION['user_id']=$stmt->result['id'];
				$_SESSION['username']=$stmt->result['name']." ".$stmt->result['last_name'];
				$_SESSION['FB_id']=$_POST['id'];
				login_check($dbh);
			}
	}
}
?>