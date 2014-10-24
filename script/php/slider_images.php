<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');

$approved=1;

if ($projects =	$dbh->prepare("SELECT projectID, project_image FROM ".$table_prefix."_projects WHERE approved = ?")){
		$projects->bindParam('1',$approved, PDO::PARAM_STR);
		$projects->execute();
		$fetchedProjects=$projects->fetchAll(PDO::FETCH_ASSOC);
}
$i=0;
foreach ($fetchedProjects as $project){
	$image_galery[$i]='files/'.$project['projectID'].'/img/thumb/thumb_'.$project['project_image'];
	$i=$i+1;
}
echo json_encode($image_galery);
?>