<script>
$( document ).ready(function() {
  scroolto("project_view_main");
});
</script>
<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/modules/project_management/project_related_functions.php';
sec_session_start();
$project_by_this_user=0;
$total_amount_pledged=0;
$total_backers=0;
$project_backed_by_thi_user=0;
$_SESSION['open_project_id']=$_GET['id'];

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_projects INNER JOIN ".$table_prefix."_users ON ".$table_prefix."_projects.userID=".$table_prefix."_users.id WHERE projectID=?")){
        	    $stmt->bindValue(1, $_GET['id']);
    			$stmt->execute();
    			$results = $stmt->fetchAll();
				$exists = $stmt->rowCount();
    			foreach ($results as $result){
					$project->id = $result['projectID'];
					$project->project_image = $result['project_image'];
    			    $project->project_title = $result['project_title'];
    			    $project->approved = $result['approved'];
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
					$project->author_img=$result['img'];
    			}
    			
        	}
if ($stmt =	$dbh->prepare("SELECT ".$table_prefix."_categories.name FROM ".$table_prefix."_categories  WHERE ID=?")){
        	    $stmt->bindValue(1, $project->category);
    			$stmt->execute();
    			$results_category = $stmt->fetch();
}

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_awards WHERE projectID=? ORDER BY amount ASC")){
        	    $stmt->bindValue(1, $_GET['id']);
    			$stmt->execute();
    			$results_awards = $stmt->fetchAll();
}
if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_user_details WHERE userID=?")){
        	    $stmt->bindValue(1, $project->userID);
    			$stmt->execute();
    			$results_user = $stmt->fetchAll();
				foreach ($results_user as $user){
					if ($user['projectID'] == $_GET['id']){
    			    	$usr->name = $user['name'];
						$usr->lastname = $user['lastname'];
						$usr->web_page = $user['web_page'];
						$usr->FB_account = $user['FB_account'];
					}
					$project_by_this_user++;
    			}
}
if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_backing WHERE confirmed=?")){
				$stmt->bindValue(1, $confirmed=1);
    			$stmt->execute();
    			$results_backed = $stmt->fetchAll();
				foreach ($results_backed as $backers){
					if ($backers['projectID']==$_GET['id']){
						$total_amount_pledged=$total_amount_pledged+$backers['amount'];
						$total_backers++;
					}
					if ($project->userID==$backers['backer_ID']){
						$project_backed_by_thi_user++;
					}
    			}
}

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_categories")){
    			$stmt->execute();
    			$categories = $stmt->fetchAll();
}

$ended=false;
$now = time();
$End_date = strtotime($project->duration);
$datediff = $End_date - $now;
$days_remaining=floor($datediff/(60*60*24))." ".spravne_cislovanie($days_remaining, " deň", " dni", " dní")." do konca";
if ($days_remaining<0){
	$days_remaining='Ukončený';
	$ended=true;
}


include('search.php');
if($exists<=0 || $project->approved!=1){
?>

	<script>
		alert("Neznámi projekt");
		window.location.href = "?";
	</script> 
<?php
}else{
?>
<div id="project_top"></div>
<div class="project_view_main" id="project_view_main">
					
	<h1>
		<?php echo $project->project_title; ?>
	</h1>
		<div class="author">
			Od <?php echo  $project->author; ?> v kategórii <?php echo $results_category['name']?>
		</div>
	<div class="project_menu">
		<?php echo "<a href='?opt=project&id=".$_GET['id']."' class='active' id='projekt'>" ?>Projekt</a><a href="javascript:void(0);" onclick="switch_project_content(2);" id='komentar'>Komentáre</a><a href="#" onclick="switch_project_content(3); " id='novinky'>Novinky</a><a href="#" onclick="switch_project_content(4); " id='backers'>Podporili</a>
	</div>
	<div id="main_project_content_holder">
		<?php include('project_view_project.php'); ?>
	</div>
</div>
<?php } ?>
<div class="clear"></div>