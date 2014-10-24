<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
global $table_prefix;
global $dbh;

switch ($_POST['option']) {
    case 1:
        first_step($dbh,$table_prefix);
        break;
    case 2:
        save_base_info($dbh,$table_prefix);
        break;
	case 3:
		save_awards($dbh,$table_prefix);
		break;
	case 4:
		delete_award($dbh,$table_prefix);
		break;
	case 5:
		save_project_image($dbh,$table_prefix);
		break;
	case 6:
		save_description($dbh,$table_prefix);
		break;
	case 7:
		save_user_details($dbh,$table_prefix);
		break;
	case 8:
		submit_project($dbh,$table_prefix);
		break;
}

function first_step($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("INSERT INTO ".$table_prefix."_projects (userID, terms_accepted, last_page_filled) VALUES (?, ?, ?)")){
		$stmt->bindParam(1, $_SESSION['user_id']);
		$stmt->bindParam(2, $terms=1);
		$stmt->bindParam(3, $last_page=2);
		$stmt->execute();
		$_SESSION['curent_new_project_ID']=$dbh1->lastInsertId();
        echo( $dbh1->lastInsertId()); //returning the new project ID
		mkdir($_SERVER['DOCUMENT_ROOT']."/files/".$_SESSION['curent_new_project_ID'],0755);
		mkdir($_SERVER['DOCUMENT_ROOT']."/files/".$_SESSION['curent_new_project_ID']."/img",0755);
		mkdir($_SERVER['DOCUMENT_ROOT']."/files/".$_SESSION['curent_new_project_ID']."/img/thumb",0755);
		mkdir($_SERVER['DOCUMENT_ROOT']."/files/".$_SESSION['curent_new_project_ID']."/img/large_thumb",0755);
	}	
}

function save_base_info($dbh1,$table_prefix){
	$current_date=date("Y-m-d H:i:s");
	$end_date=date("Y-m-d H:i:s", strtotime($current_date. ' + 45 days'));
	$last_page = last_section_done($_POST['new_project_id'], $dbh1, $table_prefix,2);
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET project_title=?, project_duration=?, project_category=?, pledge_amount=?, short_description=?, last_page_filled=? WHERE projectID=?")){
		$stmt->bindParam(1, $_POST['project_title']);
		$stmt->bindParam(2, $end_date);
		$stmt->bindParam(3, $_POST['project_category']);
		$stmt->bindParam(4, $_POST['pledge_amount']);
		$stmt->bindParam(5, $_POST['short_description']);
		$stmt->bindParam(6, $last_page);
		$stmt->bindParam(7, $_POST['new_project_id']);
		$stmt->execute();
		//echo($_SESSION['curent_new_project_ID']);//returning the current project ID
	}
	$last_page = last_section_done($_POST['new_project_id'], $dbh1, $table_prefix,2);
}

function save_awards($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("DELETE FROM ".$table_prefix."_awards WHERE projectID=?")){
			$stmt->bindParam(1, $_REQUEST['new_project_id']);
			$stmt->execute();
	}
	for ($i=1; $i<=$_REQUEST['award_num']; $i++)
	  {
		echo($i);
		echo($_REQUEST['award_title'][$i]."\n");
		echo($_REQUEST['new_project_id'][$i]."\n");
		echo($_REQUEST['amount'][$i]."\n");
		echo($_REQUEST['description'][$i]."\n");
		echo($_REQUEST['available'][$i]."\n");
		echo($_REQUEST['delivery'][$i]."\n");
		if ($stmt =	$dbh1->prepare("INSERT INTO ".$table_prefix."_awards (projectID, awardID, title, amount, description, available, delivery_date) VALUES (?, ?, ?, ?, ?, ?, ?)")){
			$stmt->bindParam(1, $_REQUEST['new_project_id']);
			$stmt->bindParam(2, $i);
			$stmt->bindParam(3, $_REQUEST['award_title'][$i]);
			$stmt->bindParam(4, $_REQUEST['amount'][$i]);
			$stmt->bindParam(5, $_REQUEST['description'][$i]);
			$stmt->bindParam(6, $_REQUEST['available'][$i]);
			$stmt->bindParam(7, $_REQUEST['delivery'][$i]);
			$stmt->execute();
		}
	} 
	$last_page = last_section_done($_POST['new_project_id'], $dbh1, $table_prefix,3);
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET last_page_filled=? WHERE projectID=?")){
		$stmt->bindParam(1, $last_page);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
		echo($_SESSION['curent_new_project_ID']);//returning the current project ID
	}
	
}

function save_project_image($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET project_image=? WHERE projectID=?")){
		$stmt->bindParam(1, $_POST['project_image']);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
	}
}

function save_description($dbh1,$table_prefix){
	$description=htmlentities($_POST['project_description'], ENT_QUOTES, "ISO-8859-1");
	
	//htmlspecialchars( (string)$_POST['project_description'] );
	echo("descritpion".$description);
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET project_description=? WHERE projectID=?")){
		$stmt->bindParam(1, $description);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
	}
	$last_page = last_section_done($_POST['new_project_id'], $dbh1, $table_prefix,4);
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET last_page_filled=? WHERE projectID=?")){
		$stmt->bindParam(1, $last_page);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
		echo($_SESSION['curent_new_project_ID']);//returning the current project ID
	}
}

function save_user_details($dbh1,$table_prefix){
	if($users = $dbh1->prepare("SELECT * FROM ".$table_prefix."_user_details WHERE userID=? AND projectID=?")){
		$users->bindParam(1, $_SESSION['user_id']);
		$users->bindParam(2, $_POST['new_project_id']);
		$users->execute();
	}
	
	if ($users->rowcount()){
		if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_user_details SET company=?, ICO=?, DIC=?, name=?, lastname=?, street_adress=?, street_number=?, city=?, PSC=?, phone=?, email=?, IBAN=?, SWIFT=?, account_number=?, bank_number=? WHERE userID=? AND projectID=?")){
			$stmt->bindParam(1, $_POST['company']);
			$stmt->bindParam(2, $_POST['ICO']);
			$stmt->bindParam(3, $_POST['DIC']);
			$stmt->bindParam(4, $_POST['name']);
			$stmt->bindParam(5, $_POST['lastname']);
			$stmt->bindParam(6, $_POST['street_adress']);
			$stmt->bindParam(7, $_POST['street_number']);
			$stmt->bindParam(8, $_POST['city']);
			$stmt->bindParam(9, $_POST['PSC']);
			$stmt->bindParam(10, $_POST['phone']);
			$stmt->bindParam(11, $_POST['email']);
			$stmt->bindParam(12, $_POST['IBAN']);
			$stmt->bindParam(13, $_POST['SWIFT']);
			$stmt->bindParam(14, $_POST['account_number']);
			$stmt->bindParam(15, $_POST['bank_number']);
			$stmt->bindParam(16, $_SESSION['user_id']);
			$stmt->bindParam(17, $_POST['new_project_id']);
			$stmt->execute();
		}
	}else{
		if ($stmt =	$dbh1->prepare("INSERT INTO ".$table_prefix."_user_details (userID, type, company, ICO, DIC, name, lastname, street_adress, street_number, city, PSC, phone, email, IBAN, SWIFT, account_number, bank_number, projectID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")){
			$stmt->bindParam(1, $_SESSION['user_id']);
			$stmt->bindParam(2, $_POST['type']);
			$stmt->bindParam(3, $_POST['company']);
			$stmt->bindParam(4, $_POST['ICO']);
			$stmt->bindParam(5, $_POST['DIC']);
			$stmt->bindParam(6, $_POST['name']);
			$stmt->bindParam(7, $_POST['lastname']);
			$stmt->bindParam(8, $_POST['street_adress']);
			$stmt->bindParam(9, $_POST['street_number']);
			$stmt->bindParam(10, $_POST['city']);
			$stmt->bindParam(11, $_POST['PSC']);
			$stmt->bindParam(12, $_POST['phone']);
			$stmt->bindParam(13, $_POST['email']);
			$stmt->bindParam(14, $_POST['IBAN']);
			$stmt->bindParam(15, $_POST['SWIFT']);
			$stmt->bindParam(16, $_POST['account_number']);
			$stmt->bindParam(17, $_POST['bank_number']);
			$stmt->bindParam(18, $_POST['new_project_id']);
			$stmt->execute();
		}
	}
	$last_page = last_section_done($_POST['new_project_id'], $dbh1, $table_prefix, 5);
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET last_page_filled=? WHERE projectID=?")){
		$stmt->bindParam(1, $last_page);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
		echo($_SESSION['curent_new_project_ID']);//returning the current project ID
	}
}

function has_the_files( $dir, $extensions = array() ) { 
    if ( empty( $extensions ) || ! is_array( $extensions ) || ! is_dir( $dir ) ) return false;
    foreach ( $extensions as $ext ) if ( count( glob( $dir . '/*.' . $ext ) ) > 0 ) $found[$ext] = 1;
    return ( count( $found ) == count( $extensions ) ) ? true : false;
}

function submit_project($dbh1,$table_prefix){
	if ($stmt =	$dbh1->prepare("UPDATE ".$table_prefix."_projects SET submited=? WHERE projectID=?")){
		$stmt->bindParam(1, $submited=1);
		$stmt->bindParam(2, $_POST['new_project_id']);
		$stmt->execute();
	}
}

function last_section_done($project_id, $dbh1, $table_prefix, $page_number){
	if ($stmt =	$dbh1->prepare("SELECT last_page_filled FROM ".$table_prefix."_projects WHERE projectID=? LIMIT 1")){
		$stmt->bindParam(1, $_POST['new_project_id']);
		$stmt->execute();
		$stmt->result=$stmt->fetch();
		if ($stmt->result['last_page_filled']<$page_number){
			return $last_page=$page_number;
		}else{
			return $last_page=$stmt->result['last_page_filled'];
		}
	}
}

?>