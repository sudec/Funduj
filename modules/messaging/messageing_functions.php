<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
global $table_prefix;
global $dbh;

switch ($_POST['option']) {
    case 1:
        add_comment($dbh,$table_prefix);
        break;
	case 2:
        add_news($dbh,$table_prefix);
        break;
	case 3:
        remove_news($dbh,$table_prefix);
        break;
	case 4:
        send_message($dbh,$table_prefix);
        break;
	case 5:
        reply_message($dbh,$table_prefix);
        break;
	case 6:
        get_massage($dbh,$table_prefix);
        break;
}

function add_comment($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("INSERT INTO  ".$table_prefix."_comments (project_id, user_id, comment) VALUES (?, ?, ?)")){
		$stmt->bindParam(1, $_POST['project_id']);
		$stmt->bindParam(2, $_SESSION['user_id']);
		$stmt->bindParam(3, $_POST['comment']);
		$stmt->execute();
		echo ("Success");
	}
	
}

function add_news($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("INSERT INTO  ".$table_prefix."_project_news (title, news, project_id, user_id) VALUES (?, ?, ?, ?)")){
		$stmt->bindParam(1, $_POST['title']);
		$stmt->bindParam(2, $_POST['news']);
		$stmt->bindParam(3, $_SESSION['open_project_id']);
		$stmt->bindParam(4, $_SESSION['user_id']);
		$stmt->execute();
		echo ("Success");
	}
}

function remove_news($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("UPDATE  ".$table_prefix."_project_news SET deleted=? WHERE id=?")){
		$stmt->bindParam(1, $deleted=1);
		$stmt->bindParam(2, $_POST['news_id']);
		$stmt->execute();
		echo ("Success");
	}
}

function send_message($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("SELECT MAX(thread) AS LastThread FROM ".$table_prefix."_messages")){    			
		$stmt->execute();
		$LastThread = $stmt->fetch();
	 	$LastThread =$LastThread['LastThread']+1;
	}
	if ($stmt =	$dbh1->prepare("INSERT INTO  ".$table_prefix."_messages (from_user, to_user,subject,message,sent_ip,thread) VALUES (?,?,?,?,?,?)")){
		$stmt->bindParam(1, $_POST['from']);
		$stmt->bindParam(2, $_POST['to']);
		$stmt->bindParam(3, $_POST['subject']);
		$stmt->bindParam(4, $_POST['message']);
		$stmt->bindParam(5, $_SERVER['REMOTE_ADDR']);
		$stmt->bindParam(6, $LastThread);
		$stmt->execute();
		echo ("Success");
	}
}

function reply_message($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("INSERT INTO  ".$table_prefix."_messages (from_user, to_user,subject,message,sent_ip,thread) VALUES (?,?,?,?,?,?)")){
		$stmt->bindParam(1, $_POST['from']);
		$stmt->bindParam(2, $_POST['to']);
		$stmt->bindParam(3, $_POST['subject']);
		$stmt->bindParam(4, $_POST['message']);
		$stmt->bindParam(5, $_SERVER['REMOTE_ADDR']);
		$stmt->bindParam(6, $_POST['thread']);
		$stmt->execute();
	}
	/************************  this part gets the messages   *********************************************/
	if ($stmt =	$dbh1->prepare("SELECT *, ".$table_prefix."_users.username AS sender FROM ".$table_prefix."_messages INNER JOIN ".$table_prefix."_users 
								ON ".$table_prefix."_messages.from_user=".$table_prefix."_users.id WHERE thread=? ORDER BY sent_time DESC")){
		$stmt->bindParam(1, $_POST['thread']);
		$stmt->execute();
		$messages = $stmt->fetchAll();
		$response['message']="";
		foreach ($messages as $message){
			$response['message']=$response['message'].'<div id="msg_body_from" class="msg_body_from">'.$message['sender'].' napísal</div>'.$message['message'];
		}
		$response['subject']=$message['subject'];
		$response['curent_user']=$_SESSION['user_id'];
		$response['sender']=$message['from_user'];
		echo json_encode($response);
	}else{
		$response['subject']="Vyskytla sa chyba";
		$response['message']="";
		$response['sender']="";
	}
	if ($response['read_status']==0){
		$current_date=date("Y-m-d H:i:s");
		if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_messages SET read_status=?, read_ip=?, read_time=? WHERE thread=?")){
			$stmt->bindParam(1, $read_status=1);
			$stmt->bindParam(2, $_SERVER['REMOTE_ADDR']);
			$stmt->bindParam(3, $current_date);
			$stmt->bindParam(4, $_POST['thread']);
			$stmt->execute();
		}
	}
}

function get_massage($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("SELECT *, ".$table_prefix."_users.username AS sender FROM ".$table_prefix."_messages INNER JOIN ".$table_prefix."_users 
								ON ".$table_prefix."_messages.from_user=".$table_prefix."_users.id WHERE thread=? ORDER BY sent_time DESC")){
		$stmt->bindParam(1, $_POST['thread']);
		$stmt->execute();
		$messages = $stmt->fetchAll();
		$response['message']="";
		foreach ($messages as $message){
			$response['message']=$response['message'].'<div id="msg_body_from" class="msg_body_from">'.$message['sender'].' napísal</div>'.$message['message'];
		}
		$response['subject']=$message['subject'];
		$response['curent_user']=$_SESSION['user_id'];
		$response['sender']=$message['from_user'];
		echo json_encode($response);
	}else{
		$response['subject']="Vyskytla sa chyba";
		$response['message']="";
		$response['sender']="";
	}
	if ($response['read_status']==0){
		$current_date=date("Y-m-d H:i:s");
		if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_messages SET read_status=?, read_ip=?, read_time=? WHERE thread=?")){
			$stmt->bindParam(1, $read_status=1);
			$stmt->bindParam(2, $_SERVER['REMOTE_ADDR']);
			$stmt->bindParam(3, $current_date);
			$stmt->bindParam(4, $_POST['thread']);
			$stmt->execute();
		}
	}
}
?>