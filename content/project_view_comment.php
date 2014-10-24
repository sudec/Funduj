<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/login.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
sec_session_start();


if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_comments INNER JOIN ".$table_prefix."_users ON ".$table_prefix."_comments.user_id=".$table_prefix."_users.id WHERE project_id=? ORDER BY created DESC")){
				$stmt->bindParam(1, $_GET['id']);
    			$stmt->execute();
    			$results_comments = $stmt->fetchAll();
				if ($stmt->rowCount()<=0){
					echo ("
					<div class='comment'>
						<p>K tomuto projektu ešte neboli pridané žiadne komentáre. </p>
					</div>
					");
				}else {
					foreach ($results_comments as $comment){
						if (strlen($comment['img'])<5){
							$avatar="../img/avatar_default.jpg";
						}
						else {
							$avatar="../users/".$comment['id']."/".$comment['img'];
						}
						echo ("
						<div class='comment'>
							<div class='avatar'>
								<img src='".$avatar."' />
							</div>
							<div class='name'>".$comment['username']."</div>
							<div class='date' title='Pridané ".date('d.m.Y H:i:s',strtotime($comment['created']))."'>".date('d.m.Y',strtotime($comment['created']))."</div>
							<p>".$comment['comment']."</p>
						</div>
						");
					}
				}
}
?>

<div id="addCommentContainer">
	<p>Pridať komentár</p>
	<form id="addCommentForm" method="post" action="">
    	<div>            
            <label for="comment_body">Komentár</label>
			<?php if (login_check($dbh) == true) { ?>
            	<pre><textarea name="comment_body" id="comment_body" cols="20" rows="5"></textarea></pre>
				<div class="button" onclick="add_comment();">Pridať</div>
			<?php } else { ?>
				<textarea name="comment_body" id="comment_body" cols="20" rows="5" disabled> Pre pridavanie komentárov musíte byť prihlásený</textarea>
			<?php } ?>
        </div>
    </form>
</div>