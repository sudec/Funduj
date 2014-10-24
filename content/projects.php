<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();


if ($_GET['opt']=='project_filter' && isset($_GET['cat']) && $_GET['cat']!=='1'){
	if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_projects WHERE approved=? AND project_category=? ORDER BY create_date DESC")){
					$stmt->bindValue(1, $approved=1);
					$stmt->bindValue(2, $_GET['cat']);
					$stmt->execute();
					$results = $stmt->fetchAll();
	}
}else{
	if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_projects WHERE approved=? ORDER BY create_date DESC")){
					$stmt->bindValue(1, $approved=1);
					$stmt->execute();
					$results = $stmt->fetchAll();
	}
}

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_backing WHERE confirmed=?")){
				$stmt->bindValue(1, $confirmed=1);
    			$stmt->execute();
    			$results_backed = $stmt->fetchAll();
				foreach ($results_backed as $backers){
					$backed_amount[$backers['projectID']]=$backed_amount[$backers['projectID']]+$backers['amount'];
    			}
}

if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_categories")){
    			$stmt->execute();
    			$categories = $stmt->fetchAll();
}

?>
<?php include('search.php');?>
<div id="projects_holder">
<?php
foreach ($results as $project){
	if($project['pledge_amount']==0.0){
		$project_percent_funded=round($backed_amount[$project['projectID']]);
	}else{
		$project_percent_funded=round(($backed_amount[$project['projectID']]/$project['pledge_amount'])*100);
	}
	$ended=false;
	$now = time();
	$End_date = strtotime($project['project_duration']);
	$datediff = $End_date - $now;
	$days_remaining=floor($datediff/(60*60*24))." ".spravne_cislovanie($days_remaining, " deň", " dni", " dní");
	if ($days_remaining<0){
		$days_remaining='Ukončený';
		$ended=true;
	}
	echo("
		<div class='project'>
			<a href='?opt=project&id=".$project['projectID']."'>
			<img src='files/".$project['projectID']."/img/thumb/thumb_".$project['project_image']."' alt='Obrazok'>
			<h1>".$project['project_title']."</h1>
			<div class='project_content'>
				".$project['short_description']."
			</div>
			<div class='progress_bar'>
				<div class='progress_bar_overlay' style='width:".( ($project_percent_funded >= 100) ? "100" : $project_percent_funded )."%'>
						
				</div>
			</div>
			</a>
			<div class='project_footer'>
				<table>
					<tbody>
						<tr>
							<td>Vyzbieraných</td>
							<td>Suma</td>
							<td>Do ukončenia</td>
						</tr>
						<tr>
							<td>".$project_percent_funded." %</td>
							<td>".$project['pledge_amount']."€</td>
							<td>".$days_remaining."</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	");
}
	?>
</div>