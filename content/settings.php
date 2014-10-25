<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
sec_session_start();
unset($_SESSION['curent_new_project_ID']);
if(login_check($dbh) == true) {
	if($users = $dbh->prepare("SELECT * FROM ".$table_prefix."_users WHERE id=? LIMIT 1")){	
			$users->bindParam(1, $_SESSION['user_id']);
			$users->execute();
			$user = $users->fetch();
		}
	if($notifications = $dbh->prepare("SELECT * FROM ".$table_prefix."_notifications WHERE user_id=? LIMIT 1")){	
			$notifications->bindParam(1, $_SESSION['user_id']);
			$notifications->execute();
			$notification = $notifications->fetch();
		}

	?>
	<div class="settings">
		<form id="user_settings" action="modules/settings/user_settings.php" method="post">
			<fieldset id="settings_left" form="settings" >
				<legend>Osobné údaje</legend>
				<label for="first_name">Meno</label><input type="text" name="first_name" id="first_name" value="<?php echo $user['name'];?>">
				<label for="last_name">Priezvisko</label><input type="text" name="last_name" id="last_name" value="<?php echo $user['last_name'];?>">
				<label for="e_mail">E-mail</label><input type="email" name="e_mail" id="e_mail" value="<?php echo $user['e_mail'];?>">
				<label for="phone">Telefón</label><input type="text" name="phone" id="phone" value="<?php echo $user['phone'];?>">
				<label for="about">O Vás</label><textarea name="about" id="about"><?php echo $user['about'];?></textarea>
				<span class="popis">V krátkosti napíšte niečo o sebe, čím sa môte ostatným použivateľom predstaviť. Ak zakladáte projekt určite odporúčame
				túto časť vyplniť.</span>
			</fieldset>
			<fieldset id="settings_right" form="settings">
				<legend>Ostatné</legend>
				<label for="usr_img" >Obrázok</label>
				<div id="usr_img"><img src="users/<?php echo $user['id'].'/img/'.$user['img'];?>"></div>
				<label for="fileuploader" >Nahrať obrázok</label>
				<div id="fileuploader2">Vybrať</div>
				<label for="conect_FB" >Facebook</label>
				<?php if (strlen($user['FB_id'])<5) {?>
				<div id="conect_FB">
					<div class="btn-fb-login">
						<span class="icon icon-fb"></span>
						<span class="title">Prihlásiť sa cez Facebook</span>
					</div>
				</div>
				<?php } else{ ?>
				<div id="conect_FB">
					<div class="btn-fb-login">
						<span class="icon icon-fb"></span>
						<span class="title">Odhlásiť Facebook</span>
					</div>
				</div>
				<?php } ?>
				<label for="url">URL</label><input type="url" id="url" name="url" value="<?php echo $user['url'];?>">
				<span class="popis">Sem môžete zadať odkaz na Vašu webovú stránku.</span>
			</fieldset>
			<div class="clear"></div>
			<fieldset id="notification" form="settings">
				<legend>Notifikácie</legend>
				<h2>
					Prispievateľ
				</h2>
				<label for="notify_new_project_added">Pridanie nového projektu</label><input type="checkbox" id="notify_new_project_added" name="notify_new_project_added" <?php if ($notification['new_pr_added']==1){echo "checked";}  ?> ><br>
				<label for="notify_best_of_the_week">Najelšie projekty za uplynulý týždeň </label><input type="checkbox" id="notify_best_of_the_week" name="notify_best_of_the_week" <?php if ($notification['best_of_the_week']==1){echo "checked";}  ?> ><br>
				<label for="notify_news_added">Pridaná novinka k podporenému projektu </label><input type="checkbox" id="notify_news_added" name="notify_news_added" <?php if ($notification['news_added']==1){echo "checked";}  ?> ><br>
				<h2>
					Projektant
				</h2>
				<label for="notify_project_backed">Príspevok na Váš projekt</label><input type="checkbox" id="notify_project_backed" name="notify_project_backed" <?php if ($notification['project_backed']==1){echo "checked";}  ?> ><br>
				<label for="notify_comment_added">Komentár na Váš projekt</label><input type="checkbox" id="notify_comment_added" name="notify_comment_added" <?php if ($notification['comment_added']==1){echo "checked";}  ?> ><br>
				<h2>
					Ostatné
				</h2>
				<label for="notify_new_message">Nová správa</label><input type="checkbox" id="notify_new_message" name="notify_new_message" <?php if ($notification['new_message']==1){echo "checked";}  ?> ><br>
			</fieldset>
			<fieldset id="change_pass" form="settings">
				<legend>Zmena Hesla</legend>
				<label for="old_pass">Pôvodné heslo</label><input type="password" id="old_pass" name="old_pass">
				<label for="new_pass">Nové heslo</label><input type="password" id="new_pass" name="new_pass">
				<label for="new_pass2">Nové heslo ešte raz</label><input type="password" id="new_pass2" name="new_pass2">
			</fieldset>
			<div class="clear"></div>
			<div id="submit_user_settings_form" class="save_button">
				Uložiť
			</div>
			<div class="clear"></div>
		</form>
	</div>
<?php }else{
	?>
	<div class="message_holder" id="error_message_holder">
	</div>
	<script>
		$( document ).ready(function() {
			display_error_message("Pre pokračovanie sa musíte prihlásiť.",1);
		});
	</script><?php
	include('content/login_form.php');
} // login check ended here
?>