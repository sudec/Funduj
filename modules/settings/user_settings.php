<?php
header('Content-Type: application/json');
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();

switch ($_POST['option']) {
    case 1:
        add_usr_picture($dbh,$table_prefix);
        break;
	case 2:
        save_changes($dbh,$table_prefix);
        break;
}

function add_usr_picture($dbh1,$table_prefix1){
	$img=$_POST['image'];
	$user_id=$_SESSION['user_id'];
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix1."_users SET img=? WHERE id=?")){
		$stmt->bindParam(1, $img);
		$stmt->bindParam(2, $user_id);
		$stmt->execute();
	}
	echo json_encode(array('user_id' => $_SESSION['user_id'],'files'=> $_POST['image']));// required in production
}

function save_changes($dbh1,$table_prefix1){
	if ($insert_stmt = $dbh1->prepare("UPDATE ".$table_prefix1."_users SET name=?, last_name=?, e_mail=?, about=?, url=?, phone=? WHERE id=?")) {    
		$insert_stmt->bindParam(1, $_POST['first_name']);
		$insert_stmt->bindParam(2, $_POST['last_name']);
		$insert_stmt->bindParam(3, $_POST['e_mail']);
		$insert_stmt->bindParam(4, $_POST['about']);
		$insert_stmt->bindParam(5, $_POST['url']);
		$insert_stmt->bindParam(6, $_POST['phone']);
		$insert_stmt->bindParam(7, $_SESSION['user_id']);
		$insert_stmt->execute();
	}
	$notify_new_project_added=0;
	$notify_best_of_the_week=0;
	$notify_news_added=0;
	$notify_projeckt_backed=0;
	$notify_comment_added=0;
	$notify_new_message=0;
	if (isset($_POST['notify_new_project_added'])){$notify_new_project_added=1;}
	if (isset($_POST['notify_best_of_the_week'])){$notify_best_of_the_week=1;}
	if (isset($_POST['notify_news_added'])){$notify_news_added=1;}
	if (isset($_POST['notify_project_backed'])){$notify_projeckt_backed=1;}
	if (isset($_POST['notify_comment_added'])){$notify_comment_added=1;}
	if (isset($_POST['notify_new_message'])){$notify_new_message=1;}
	if ($insert_stmt = $dbh1->prepare("UPDATE ".$table_prefix1."_notifications SET new_pr_added=?, best_of_the_week=?, news_added=?, project_backed=?, comment_added=?, new_message=? WHERE user_id=?")) {    
		$insert_stmt->bindParam(1, $notify_new_project_added);
		$insert_stmt->bindParam(2, $notify_best_of_the_week);
		$insert_stmt->bindParam(3, $notify_news_added);
		$insert_stmt->bindParam(4, $notify_projeckt_backed);
		$insert_stmt->bindParam(5, $notify_comment_added);
		$insert_stmt->bindParam(6, $notify_new_message);
		$insert_stmt->bindParam(7, $_SESSION['user_id']);
		$insert_stmt->execute();
	}
	$array['status'] = 'success';
	$array['message'] = "Údaje boli úspešne uložené";
	$array = array();
	if(!empty($_POST['new_pass'])){// if new password is posted and it matches the confirm password
		//chnage password
		if (strcmp($_POST['new_pass'],$_POST['new_pass2'])==0){
			if ($stmt =	$dbh1->prepare("SELECT id, username, password, salt FROM ".$table_prefix1."_users WHERE id = ? LIMIT 1")){//select the data to confirm the old passowrd is corect
				$stmt->bindParam('1',$_SESSION['user_id'], PDO::PARAM_STR);
				$stmt->execute();
				$stmt->result=$stmt->fetch();
				$id=$stmt->result['id'];
			//has the typed password with the salt from the databe and compare with the one in the database
				$password = hash('sha512', $_POST['old_pass_enc'].$stmt->result['salt']);
				if ($stmt->rowCount() == 1){
						if($stmt->result['password'] == $password) {
							$random_salt = hash('sha512', uniqid(mt_rand(1, mt_getrandmax()), true));
						   // Create salted password (Careful not to over season)
							$password1 = hash('sha512', $_POST['new_pass_enc'].$random_salt);
							$array['New password'] = $password1;
							if ($insert_stmt = $dbh1->prepare("UPDATE ".$table_prefix1."_users SET password=?, salt=? WHERE id=?")) {    
								$insert_stmt->bindParam(1, $password1);
								$insert_stmt->bindParam(2, $random_salt);
								$insert_stmt->bindParam(3, $_SESSION['user_id']);
								$insert_stmt->execute();
								$user_browser = $_SERVER['HTTP_USER_AGENT'];
								$_SESSION['login_string'] = hash('sha512', $password1.$user_browser);
									$array['status'] = 'success';
									$array['message'] = "Údaje boli úspešne uložené";
							}else{
								$array['status'] = 'error';
								$array['message'] = "Pri ukladaní údajov sa vyskytla chyba";
							}
						}else{
							$array['status'] = 'error';
							$array['message'] = "Nesprávne pôvodné heslo";
						}
				}
			}
		}else{
			$array['status'] = 'error';
			$array['message'] = "Heslá sa nezhodujú";
		}
	}else{
		$array['status'] = 'success';
		$array['message'] = "Údaje boli úspešne uložené";
	}
	echo json_encode($array);
}
?>