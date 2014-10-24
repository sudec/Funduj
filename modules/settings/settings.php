<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();

if($stmt = $dbh->prepare("SELECT * FROM ".$table_prefix."_projects WHERE projectID=? AND userID=?")){
	$stmt->bindParam(1, $_GET['new_project_id']);
	$stmt->bindParam(2, $_SESSION['user_id']);
	$stmt->execute();
	$projects = $stmt->fetch();
	if($stmt->rowcount()){
		$curentuser=1;
		$project_image=$projects['project_image'];
		$project_description=$projects['project_description'];
					$project->project_title = $projects['project_title'];
    			    $project->approved = $projects['approved'];
    			    $project->category=$projects['project_category'];
    			    $project->project_location=$projects['project_location'];
                    $project->duration=$projects['project_duration'];
                    $project->pledge_amount=$projects['pledge_amount'];
                    $project->short_description=$projects['short_description'];
                    $project->project_chalanges=$projects['project_chalanges'];
                    $project->faq=$projects['project_faq'];
                    $project->project_video=$projects['project_video'];
                    $project->project_description=$projects['project_description'];
                    $project->userID=$projects['userID'];
					$project->status=$projects['status'];
					$project->create_date=$projects['create_date'];
					$project->user_type=$projects['user_type'];
					$project->statusID=$projects['statusID'];
					$project->terms_accepted=$projects['terms_accepted'];
					$project->project_image=$projects['project_image'];
					$project->submited=$projects['submited'];
	}else{
		$curentuser=0;
	}
}

if($users = $dbh->prepare("SELECT * FROM ".$table_prefix."_user_details WHERE userID=?")){
		$users->bindParam(1, $_SESSION['user_id']);
		$users->execute();
		$user=$users->fetch();
		$display_user_details=$users->rowcount();
	}
?>

	
			<?php 
				if(login_check($dbh) == true) {
					
			?>
	<script>
	$(".message").css("visibility","visible");
	$(".message").text("Pre pokračovanie sa musíte prihlásiť");
	$('.signup_window').bPopup({
			positionStyle: 'fixed'
	});
	</script>
			<?php
				}
			?>		
