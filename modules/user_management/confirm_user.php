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
				//Check if any entry matches the specified confirm hash
				if($select_stmt->rowcount()==0){
					if($hash_missing_stmt = $dbh->prepare("SELECT username FROM ".$table_prefix."_users WHERE id=? LIMIT 1")){
						$hash_missing_stmt->bindValue(1, $note_id);
						$hash_missing_stmt->execute();
						$registered_id = $hash_missing_stmt->fetch();
						//check if user with the specified id already exists
						if($hash_missing_stmt->rowcount()!=0){
							?><script>display_error_message("Aktivančný odkaz už bol použitý. Konto ste už aktivovali. Skúste sa prihlásiť.",1);</script><?php
							if(login_check($dbh) == false){
								include('content/login_form.php');
							}
						}else{
							?><script>display_error_message("Aktivančný odkaz nie je platný alebo už bol použitý.",1);</script><?php
							if(login_check($dbh) == false){
								include('content/login_form.php');
							}
						}
					}
				}else{
					// Copy the selected data to the live users table, thus confirming the user email.
					if ($insert_stmt = $dbh->prepare("INSERT INTO ".$table_prefix."_users (username, e_mail, password, salt, member_since) VALUES (?, ?, ?, ?, ?)")) {    
								  $insert_stmt->bindValue(1, $results['username']);
								  $insert_stmt->bindValue(2, $results['e_mail']);
								  $insert_stmt->bindValue(3, $results['password']);
								  $insert_stmt->bindValue(4, $results['salt']);
								  $insert_stmt->bindValue(5, $results['member_since']);
								  // Execute the prepared query.
								  $insert_stmt->execute();
						
								  $last_inserted_user_id=$dbh->lastInsertId();
								  mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_inserted_user_id,0755);
								  mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_inserted_user_id."/img",0755);
								  mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_inserted_user_id."/img/thumb",0755);
								  mkdir($_SERVER['DOCUMENT_ROOT']."/users/".$last_inserted_user_id."/img/large_thumb",0755);
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
				}
}else{
?>
<script>
display_error_message("Pri aktivácii sa vyskytla chyba. Prosím skúste to znova neskôr","1");
</script>
<?php
}
?>
