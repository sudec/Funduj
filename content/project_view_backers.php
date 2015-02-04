<?php 
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/login.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
include $_SERVER['DOCUMENT_ROOT'].'/config.php';

$confirmed=1;

if (isset($_GET['sort'])){
	$sort="ORDER BY amount ";
	if ($_GET['sort']=='sort_desc'){
		$sort = $sort."DESC";
	}elseif ($_GET['sort']=='sort_asc') {
		$sort = $sort."ASC";
	}else{
		$sort="ORDER BY time ASC";
	}
}else{
	$sort="ORDER BY time ASC";
}
if ($stmt =	$dbh->prepare("SELECT *, ".$table_prefix."_backing.public AS public, ".$table_prefix."_backing.time AS time, ".$table_prefix."_backing.amount AS amount, 
							".$table_prefix."_backing.confirmed AS confirmed, ".$table_prefix."_users.username AS username, ".$table_prefix."_users.id AS user_id
							, ".$table_prefix."_users.id AS user_id
							FROM ".$table_prefix."_backing 
							INNER JOIN ".$table_prefix."_users ON ".$table_prefix."_backing.backer_ID=".$table_prefix."_users.id 
							WHERE projectID=? AND confirmed=? ".$sort)){
							$stmt->bindParam(1, $_GET['id']);
							$stmt->bindParam(2, $confirmed);
			    			$stmt->execute();
			    			$results_backings = $stmt->fetchAll();
							if ($stmt->rowCount()<=0){
								echo ("
								<div class='id='news' class='news'>
									<p>Na tento projekt este nikto neprispel. Budte prvy!</p>
								</div>
								");
							}else {

								echo "
								<div class='backing_sort'>
									<img onclick=sort_backers(this) id='sort_desc' src='../img/down_arrow.png'>
									<img src='../img/down_arrow.png' onclick=sort_backers(this) id='sort_asc' class='rotate_image_180'>
								</div>
								";
								foreach ($results_backings as $backings){
									if ($backings['public']==1){
										if (strlen($backings['img'])<5){
											$avatar="../img/avatar_default.jpg";
										}
										else {
											$avatar="../users/".$backings['user_id']."/".$backings['img'];
										}
										echo "
										<div class='backer_list'>
											<div class='backer_img'>
												<img src='".$avatar."'>
											</div>
											<div class='backer_username'>
												".$backings['username']."
											</div>
											<div class='backer_amount'>
												".$backings['amount']." €
											</div>
										</div>

										";
										//echo ($backings['amount']."-".$backings['username']."</br>");
									}else{
										echo "
										<div class='backer_list'>
											<div class='backer_img'>
												<img src='../img/avatar_default.jpg'>
											</div>
											<div class='backer_username'>
												Anonym
											</div>
											<div class='backer_amount'>
												".$backings['amount']." €
											</div>
										</div>

										";
									}
															
								}
							}
}
else{
	echo ("Ospravedľňujeme sa, ale nepodarilo sa nadviazat spojenie s databazou. Prosim skúste opať neskôr.");
}
?>

