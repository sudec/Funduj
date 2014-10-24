<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/login.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
sec_session_start();


if ($stmt =	$dbh->prepare("SELECT *, ".$table_prefix."_project_news.news AS news, ".$table_prefix."_projects.userID AS project_by
							FROM ".$table_prefix."_project_news INNER JOIN ".$table_prefix."_projects 
							ON ".$table_prefix."_project_news.project_id=".$table_prefix."_projects.projectID 
							WHERE projectID=? ORDER BY created DESC")){
				$stmt->bindParam(1, $_GET['id']);
    			$stmt->execute();
    			$results_news = $stmt->fetchAll();
				if ($stmt->rowCount()<=0){
					echo ("
					<div class='id='news' class='news'>
						<p>K tomuto projektu ešte neboli pridané žiadne novinky. </p>
					</div>
					");
				}else {
					foreach ($results_news as $news){
						$project_by_current_user=false;
						if ($news['deleted']==0 && $news['hidden']==0){
							echo ("
							<div id='news' class='news'>
								<div id='date' title='Pridané ".date('d.m.Y H:i:s',strtotime($news['created']))."'>".date('d.m.Y',strtotime($news['created']))."</div>
								<div id='header'>".$news['title']."</div>");
							echo nl2br("<div id='content'>
									".$news['news']."
								</div>");
							if ($news['project_by']==$_SESSION['user_id']){
								$project_by_current_user=true;
								echo ("
									<div id='delete' onclick='remove_news(".$news['id'].");'>Vymazať</div>
								</div>
								");
							}else{
								echo("</div>");
							}
						}
					}
				}
}
else{
	echo ("Ospravedľňujeme sa, ale nepodarilo sa nadviazat spojenie s databazou. Prosim skúste opať neskôr.");
}

if ($project_by_current_user){
?>
<div class="add_news">
<div id="addNewsContainer">
	<p>Pridať novinku</p>
	<form id="addNewsForm" method="post" action="">
    	<div>
			<label for="news_header">Novinka</label>
			<input type="text" name="news_header" id="news_header">
            <label for="news_body">Novinka</label>
            	<pre><textarea name="news_body" id="news_body" cols="20" rows="5"></textarea></pre>
				<div class="button" onclick="add_news();">Pridať</div>
        </div>
    </form>
</div>
</div>
<?php
}
?>