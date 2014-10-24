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

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_projects WHERE projectID=?")){
        	    $stmt->bindValue(1, $_GET['new_project_id']);
    			$stmt->execute();
    			$results = $stmt->fetchAll();
				$exists = $stmt->rowCount();
    			foreach ($results as $result){
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
					$project->submited=$result['submited'];
    			}
    			
        	}
if ($stmt =	$dbh->prepare("SELECT ".$table_prefix."_categories.name FROM ".$table_prefix."_categories  WHERE ID=?")){
        	    $stmt->bindValue(1, $project->category);
    			$stmt->execute();
    			$results_category = $stmt->fetch();
}

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_awards WHERE projectID=? ORDER BY amount ASC")){
        	    $stmt->bindValue(1, $_GET['new_project_id']);
    			$stmt->execute();
    			$results_awards = $stmt->fetchAll();
}
if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_user_details WHERE userID=?")){
        	    $stmt->bindValue(1, $project->userID);
    			$stmt->execute();
    			$results_user = $stmt->fetchAll();
				foreach ($results_user as $user){
					if ($user['projectID'] == $_GET['new_project_id']){
    			    	$usr->name = $user['name'];
						$usr->lastname = $user['lastname'];
						$usr->web_page = $user['web_page'];
						$usr->FB_account = $user['FB_account'];
					}
					$project_by_this_user++;
    			}
}
if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_backing")){
    			$stmt->execute();
    			$results_backed = $stmt->fetchAll();
				foreach ($results_backed as $backers){
					if ($backers['projectID']==$_GET['new_project_id']){
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

if($project->approved!=0 || $project->userID!=$_SESSION['user_id'] || $exists!=1){
?>
	<script>
		alert("Neznámi projekt");
		window.location.href = "?";
	</script> 
<?php
}else{
?>
<div id="submit_box">
<a href="javascript:void(0)" id="newpr_submit_project" onclick="submit_project()"><div class="save_button">Odoslať na schválenie</div></a>
	<a href="?opt=new_project&page=5&new_project_id=<?php echo $_GET['new_project_id']; ?>" id="newpr_submit_awards"><div class="button">Späť</div></a>
	<div class="confirm_submit"></div>
</div>
<div class="project_view_main">
	<h1>
		<?php 
	  if (strlen($project->project_title)<=1){
		  echo "Názov projektu";
	  }else{
		  echo $project->project_title;
	  }
	   ?>
	</h1>
		<div class="author">
			Od <?php echo  $usr->name; ?> v kategórii <?php echo $results_category['name']?>
		</div>
	<div class="project_menu">
		<a href="#">Projekt</a><a href="#">Komentáre</a><a href="#">Novinky</a>
	</div>
	<div class="left">
		<div class="main_image_holder">
			<div class="main_project_image">
				<?php echo("<img src='files/".$_GET['new_project_id']."/img/".$project->project_image."'>"); ?>
			</div>			
			<div class="slider">
				<div class="carousel">
					<div class="main">
						<div class="left_arrow">
							<img src="../img/left_carousel_arrow.png">
						</div>
						<div class="holder">
							
						</div>
						<div class="right_arrow">
							<img src="../img/right_carousel_arrow.png">
						</div>
					</div>
				</div>
				<script>carousel_populate_images();</script>
			</div>
		</div>
		<div class="description">
			<?php echo html_entity_decode($project->project_description); ?>
		</div>
	</div>
	<div class="right">
		<div class="funding_overview">
			<div class="content">
				<h2>Vyzbieraných</h2><h1><?php echo $total_amount_pledged; ?> z <?php echo $project->pledge_amount; ?> €</h1>
				<h2>Ostáva</h2><h1><?php echo $days_remaining;?></h1>
				<h2>Doteraz</h2><h1><?php echo $total_backers." ".spravne_cislovanie($total_backers, "podporil", "podporili", "podporilo");?></h1>
				<hr>
				<?php 
				if (!$ended){
				?>
				<div class="fund_button">Podporiť</div>
				<?php 
				}else{
				?>
				<div class="button_disabled" title="Tento projekt bol ukončený">Podporiť</div>
				<?php
				}
				?>
			</div>
		</div>
		<div class="author_overview">
			<div class="content">	
				<div class="top">
					O autorovi
				</div>
				<div class="midle">
					<div class="image"><img src="img/test_autor_img.jpg"></div>
					<div class="image_right">
						<p><?php echo  $usr->name; ?> <?php echo  $usr->lastname; ?></p>
						<p><?php echo  $project_by_this_user; echo spravne_cislovanie($project_by_this_user, " projekt", " projekty", " projektov");?></p>
						<p><?php echo  $project_backed_by_thi_user; echo spravne_cislovanie($project_backed_by_thi_user, " podporený", " podporené", " podporených");?></p>
					</div>
				</div>
				<a href="<?php echo  $usr->FB_account; ?> " target="_blank"><p style="margin-top:15px;"><i class="fa fa-facebook"></i> Facebook</p></a>
				<hr>
				<p style="margin-bottom:25px;"><a href="http://<?php echo  $usr->web_page; ?>" target="_blank"><?php echo  $usr->web_page; ?></a></p>
				<div class="button">
					Kontaktovať autora
				</div>
			</div>
		</div>
			<?php
			foreach ($results_awards as $award){
				$rew_class="reward";
				$color="green";
				$delivery = sk_datum(strtotime($award['delivery_date']));
				if ($award['available']<=0){
					$available=" ";
				}
				else {
					$available=$award['available']-$award['backers']." z ".$award['available']." dostupných";
					if ($award['available']==$award['backers']){
						$rew_class="reward_all_gone";
						$color="red";
					}
				}
				echo("
				<div class='".$rew_class."'>
					<div class='content'>
						<h1>Prispieť ".$award['amount']."€</h1>
						 ".$award['description']."
						<hr>
						<h2>".$award['backers']." ".spravne_cislovanie($award['backers'], " príspevok", " príspevky", " príspevkov")."</h2>
						<hr>
						<p class='".$color."'>".$available."</p>
						<p>Dátum dodania: ".$delivery."</p>
					</div>
				</div>
				");
    		}
			?>
	</div>
</div>
<?php } ?>
<div class="clear"></div>