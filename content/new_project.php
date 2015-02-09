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
		$project->last_page_filled=$projects['last_page_filled'];
	}else{
		$curentuser=0;
	}
}

if($awards = $dbh->prepare("SELECT * FROM ".$table_prefix."_awards WHERE projectID=? ORDER BY awardID")){
	$awards->bindParam(1, $_GET['new_project_id']);
	$awards->execute();
	$number_of_curent_awards=$awards->rowcount();
	if($number_of_curent_awards>0){$awards_added=1;}else{$awards_added=0;}
	$all_wards_completed=0;
	$all_awards=$awards->fetchAll();
	foreach ($all_awards as $award){
		if ($award['amount']>0 && strlen($award['description'])>0 && $award['delivery_date']>'0000-00-00'){
			$all_wards_completed=1;
		}else{
			$all_wards_completed=0;
		}
	}
}

if($users = $dbh->prepare("SELECT * FROM ".$table_prefix."_user_details WHERE userID=? AND projectID=?")){
		$users->bindParam(1, $_SESSION['user_id']);
		$users->bindParam(2, $_GET['new_project_id']);
		$users->execute();
		$user=$users->fetch();
		$display_user_details=$users->rowcount();
	}
if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_categories")){
    			$stmt->execute();
    			$categories = $stmt->fetchAll();
}


?>

<div id="newpr_main">
	<div class="header">
		<div id="newpr_breadcrums">
			<ul>
				<li id="1">Pravidlá</li>
				<li id="2"><?php if ($project->last_page_filled >= 2 ){echo "<a href='?opt=new_project&page=2&new_project_id=".$_GET['new_project_id']."'>Základné Informácie</a>";}else{echo "Základné Informácie";}?></li>
				<li id="3"><?php if ($project->last_page_filled >= 3 ){echo "<a href='?opt=new_project&page=3&new_project_id=".$_GET['new_project_id']."'>Odmeny</a>";}else{echo "Odmeny";}?></li>
				<li id="4"><?php if ($project->last_page_filled >= 4 ){echo "<a href='?opt=new_project&page=4&new_project_id=".$_GET['new_project_id']."'>Popis</a>";}else{echo "Popis";}?></li>
				<li id="5"><?php if ($project->last_page_filled >= 5 ){echo "<a href='?opt=new_project&page=5&new_project_id=".$_GET['new_project_id']."'>O Autorovi</a>";}else{echo "O Autorovi";}?></li>
				<li id="6"><?php if ($project->last_page_filled >= 6 ){echo "<a href='?opt=new_project&page=6&new_project_id=".$_GET['new_project_id']."'>Prehľad</a>";}else{echo "Prehľad";}?></li>
			</ul>
		</div>
	</div>
	
			<?php 
				if(login_check($dbh) == true) {
					
					if ($project->terms_accepted==1){ ?><script>$( "#1" ).prepend("<img src='/img/tick.png'>");</script><?php }
					if (strlen($project->project_title)>=1 && strlen($project->short_description)>=1 && strlen($project->project_image)>=1 &&  $project->pledge_amount>0 && $project->category>0){ ?>
						<script>$( "#2" ).prepend("<img src='/img/tick.png'>");</script><?php }
					if ($number_of_curent_awards>=1 && $all_wards_completed==1){ ?><script>$( "#3" ).prepend("<img src='/img/tick.png'>");</script><?php }
					if (strlen($project_description)>1){ ?><script>$( "#4" ).prepend("<img src='/img/tick.png'>");</script><?php }
					if ($display_user_details>=1){ ?><script>$( "#5" ).prepend("<img src='/img/tick.png'>");</script><?php }
					if ($project->submited==1){ ?><script>$( "#6" ).prepend("<img src='/img/tick.png'>");</script><?php }
					
					
					if ($_GET['page']=='1' || !isset($_GET['new_project_id']) || $_GET['new_project_id']==null || $curentuser==0)
					{
						include('new_project/conditions.php');
						?>
						<script>
							$( "#1" ).addClass( "active" );
						</script>
						<?php
					}
					if ($curentuser==1){
						if ($_GET['page']=='2' && isset($_GET['new_project_id']) )
						{
							include('new_project/base.php');
							?>
								<script>
								$( "#2" ).addClass( "active" );
								</script>
							<?php
						}
						if ($_GET['page']=='3' && isset($_GET['new_project_id']))
						{
							include('new_project/awards.php');
							?>
								<script>
								$( "#3" ).addClass( "active" );
								</script>
							<?php
						}
						if ($_GET['page']=='4' && isset($_GET['new_project_id']))
						{
							include('new_project/description.php');
							?>
								<script>
								$( "#4" ).addClass( "active" );
								</script>
							<?php
						}
						if ($_GET['page']=='5' && isset($_GET['new_project_id']))
						{
							include('new_project/about_author.php');
							?>
								<script>
								$( "#5" ).addClass( "active" );
								</script>
							<?php
						}
						if ($_GET['page']=='6' && isset($_GET['new_project_id']))
						{
							include('new_project/overview.php');
							?>
								<script>
								$( "#6" ).addClass( "active" );
								</script>
							<?php
						}
					}
				}else{
					$_SESSION['curent_page']=$_SERVER['SERVER_NAME']."/".$_SERVER['QUERY_STRING'];
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
</div>