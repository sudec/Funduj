<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/login.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/modules/messaging/messageing_functions.php';
sec_session_start();

	if ($stmt =	$dbh->prepare("SELECT *, ".$table_prefix."_users.username AS sender, ".$table_prefix."_users.id AS sender_id, ".$table_prefix."_messages.id AS id FROM ".$table_prefix."_messages INNER JOIN ".$table_prefix."_users 
								ON ".$table_prefix."_messages.from_user=".$table_prefix."_users.id WHERE ".$table_prefix."_messages.to_user=? GROUP BY thread ORDER BY sent_time DESC"))
	{    			
		$stmt->bindParam(1, $_SESSION['user_id']);
		$stmt->execute();
		$messages = $stmt->fetchAll();
		$messages_count = $stmt->rowCount();
		
	}
if ($messages_count == 0){
?>
<div class="message_holder" id="error_message_holder" style="display:block;">
Nemáte žiadnu poštu
</div>
<?php
}else{
?>
<style type="text/css">
	#mCSB_1_container{
	 width: 288px;
}
</style>
<div id="msg_holder">
	<div id="msg_navigation">
		

<?php
$first=true;
$i=0;
foreach ($messages as $message){
	$class="";
	if 	($message['read_status']==0){
		$class="unread";
	}
	if ($first==true) {
			$class="active";
	}
	if ($message['deleted']==0){
		echo (
			"<div id='msg_overview_".$i."' class='".$class." msg_overview' onclick='getmessagecontent(".$message['thread'].",".$i.")'>
				<div class='msg_from'>
					".$message['sender']."
				</div>
				<div class='msg_date' title='Prijaté ".date('d.m.Y H:i:s',strtotime($message['sent_time']))."'>
					".date('d.m H:i',strtotime($message['sent_time']))."
				</div>
				<div class='msg_title'>
					".$message['subject']."
				</div>
			</div>"
		);
	}
	$i=$i+1;
	if ($first==true) {
		$first_title = $message['subject'];
		$first_message = $message['message'];
		$first_from = $message['sender'];
		$first_thread = $message['thread'];
		$first_sender_id = $message['sender_id'];
		$first=false;
	}
}
?>
	</div>
	<div id="msg_body_holder">
		<div id="msg_holder_title">
			<?php echo $first_title;?>
		</div>
		<div id="msg_body">
			<div id="msg_body_from" class="msg_body_from"><?php echo $first_from; ?> napísal:</div>
			<?php echo $first_message;?>
		</div>
		<div id="msg_reply">
			<textarea id="reply_message"></textarea>
			<div id="button_holder">
				<div id="message_send_button" class="button" onclick="reply_message(<?php echo $first_sender_id;?>,<?php echo $_SESSION['user_id'];?>, <?php echo $first_thread;?>)">Odoslať</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	getmessagecontent(<?php echo $first_thread;?>,0);	
}
</script>
<?php } ?>