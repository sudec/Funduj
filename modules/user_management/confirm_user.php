<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';

// Save the $_GET data
$confirm_has=$_GET['uiaid'];
$note_id=$_GET['note'];

//Select the data from the temporary database based on the link used by the user
if ($select_stmt = $dbh->prepare("SELECT username, e_mail, password, salt, member_since FROM ".$table_prefix."_users_not_confirmed WHERE confirm_hash=? and id=? LIMIT 1")) {    
				$select_stmt->bindValue(1, $confirm_has);
				$select_stmt->bindValue(2, $note_id);
				  // Execute the prepared query.
				$select_stmt->execute();
				$results = $select_stmt->fetch();
				echo $results['username'];
				 
	// Copy the selected data to the live users table, thus confirming the user email.
	if ($insert_stmt = $dbh->prepare("INSERT INTO ".$table_prefix."_users (username, e_mail, password, salt, member_since) VALUES (?, ?, ?, ?, ?)")) {    
				  $insert_stmt->bindValue(1, $results['username']);
				  $insert_stmt->bindValue(2, $results['e_mail']);
				  $insert_stmt->bindValue(3, $results['password']);
				  $insert_stmt->bindValue(4, $results['salt']);
				  $insert_stmt->bindValue(5, $results['member_since']);
				  // Execute the prepared query.
				  $insert_stmt->execute();
				
				// Delete the entry from the temporary users database
				 if ($select_stmt = $dbh->prepare("DELETE FROM ".$table_prefix."_users_not_confirmed WHERE confirm_hash=? and id=? LIMIT 1")) {    
						$select_stmt->bindValue(1, $confirm_has);
						$select_stmt->bindValue(2, $note_id);
						  // Execute the prepared query.
						$select_stmt->execute();
				 }
		
				?><script>display_error_message("Vaše konto bolo úspešne aktivované. Môžete sa prihlásiť.","0");</script><?php
	}else{
		?><script>display_error_message("Pri aktivácii sa vyskytla chyba. Prosím skúste to znova neskôr","1");</script><?php
	}
}else{
?>
<script>
display_error_message("Pri aktivácii sa vyskytla chyba. Prosím skúste to znova neskôr","1");
</script>
<?php
}
?>
