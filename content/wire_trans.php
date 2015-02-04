<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();

$project_id = $_GET['project_id'];
$award_id = $_GET['award_id'];
$prevent_backing = false;
$now = time();

if ($_GET['public']=='false'){
	$public = 1;
}else{
	$public = 0;
}

   // All login attempts are counted from the past 2 hours. 
$valid_attempt = $now - (2 * 60 * 60);
if(login_check($dbh) == true) {
	if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_backing WHERE projectID=? AND backer_ID=? AND award_ID=? AND amount=? ORDER BY ID DESC LIMIT 1")){
		$stmt->bindValue(1, $project_id);
		$stmt->bindValue(2, $_SESSION['user_id']);
		$stmt->bindValue(3, $award_id);
		$stmt->bindValue(4, round($_GET['amount'],2));
		$stmt->execute();
		$results = $stmt->fetch();
		$exists = $stmt->rowCount();
		if (strtotime($results['time'])>$valid_attempt){
			$prevent_backing=true;
			?><script>display_error_message("Na tento projekt ste uz pripeli rovnakou sumou za posledne 2 hodiny. Rovnakou čiastkou za rovnaku odmenu na tento projekt môžete znova prispieť neskôr.","1");</script><?php
		}
	}
	if ($prevent_backing==false){
		if ($stmt =	$dbh->prepare("INSERT INTO ".$table_prefix."_backing (projectID, backer_ID, award_ID, amount, type, public) VALUES (?, ?, ?, ?, ?, ?)")){
					$stmt->bindValue(1, $project_id);
					$stmt->bindValue(2, $_SESSION['user_id']);
					$stmt->bindValue(3, $award_id);
					$stmt->bindValue(4, round($_GET['amount'],2));
					$stmt->bindValue(5, $type="wire_trans");
					$stmt->bindValue(6, $public);
					$stmt->execute();
					$last_backing_id=$dbh->lastInsertId();
		}
		// Invoice number consists of THE BACKING 
		if ($stmt =	$dbh->prepare("UPDATE ".$table_prefix."_backing SET invoice=? WHERE ID=?")){
					$stmt->bindValue(1, $last_backing_id);
					$stmt->bindValue(2, $last_backing_id);
					$stmt->execute();
		}
	}
		if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_projects INNER JOIN ".$table_prefix."_users ON ".$table_prefix."_projects.userID=".$table_prefix."_users.id WHERE projectID=? LIMIT 1")){
					$stmt->bindValue(1, $project_id);
					$stmt->execute();
					$results = $stmt->fetchAll();
					foreach ($results as $result){
						$project->id = $result['projectID'];
						$project->project_title = $result['project_title'];
						$project->category=$result['project_category'];
						$project->project_location=$result['project_location'];
						$project->duration=$result['project_duration'];
						$project->pledge_amount=$result['pledge_amount'];
						$project->short_description=$result['short_description'];
						$project->project_chalanges=$result['project_chalanges'];
						$project->faq=$result['project_faq'];
						$project->project_video=$result['project_video'];
						$project->project_description=$result['project_description'];
						$project->userID=$result['userID'];
						$project->status=$result['status'];
						$project->create_date=$result['create_date'];
						$project->user_type=$result['user_type'];
						$project->statusID=$result['statusID'];
						$project->author=$result['username'];
					}

		}
	if ($prevent_backing==false){
		if ($stmt =	$dbh->prepare("UPDATE ".$table_prefix."_awards SET backers=backers+1 WHERE projectID=? AND entryID=?")){
			$stmt->bindParam(1, $project_id);
			$stmt->bindParam(2, $award_id);
			$stmt->execute();
		}
	}
	?>
	<div class="project_name_top">
		<div id="project_title_top_payment"><?php echo $project->project_title; ?></div>
		<div id="project_author_top_payment"><?php echo $project->author; ?></div>
	</div>
	<div id="trans_data_wrap">
		<h1>
			Platobný príkaz
		</h1>
		<div id="wire_trans_data">
			<span>Pre uhradenie príspevku prosím prevedte zvolenú sumu na nasledovný bankový účet. Pre správne spárovanie prosím nezabudnite uviesť variabilný symbol. </span>
			<div id="acount_details">
				<span class="wire_details" id="acount_number"><b>Číslo účtu:</b> 2927909112</span>
				<span class="wire_details" id="bank_number"><b>Číslo banky:</b> 1100</span>
				<span class="wire_details" id="variable_sym"><b>Variabilný symbol:</b> <?php echo $last_backing_id;?>
				<span class="wire_details" id="sum"><b>Suma:</b> <?php echo round($_GET['amount'],2);?> €</div>
			</div>
		</div>
		<a href="?">
			<div class="button">
				Späť na úvod
			</div>
		</a>
	</div>
<?php }else{
	?><script>display_error_message("Pre pokračovanie sa musíte prihlásiť.",1);</script><?php
	include('content/login_form.php');
} // login check ended here
?>