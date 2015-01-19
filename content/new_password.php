<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
if(login_check($dbh) != true) {
	
	if ($stmt =	$dbh->prepare("SELECT id, requested FROM ".$table_prefix."_password_reset WHERE hash = ? LIMIT 1")){
		$stmt->bindParam(1,$_GET['dlksje']);
		$stmt->execute();
		$stmt->result=$stmt->fetch();
		if (($stmt->rowCount() < 1) || (strtotime($stmt->result['requested']) < strtotime('-24 hours'))){
			?>
			<script>display_error_message("Odkaz pre obnovu hesla je neplatný alebo už bol použitý", 1)</script>
			<?php
		}else{ 
?>

<div id="signup" class="signup_window" style="width:300px;min-height:0px;">
	<div id="reset_pwd">
		<h1>Zmena hesla</h1>
		<hr style="	margin-bottom: 30px;"/>
			<p>Zadajte Vaše nové heslo</p>
		<input type="text" name="reset_pwd1" id="reset_pwd1" value="Nové heslo..."  onfocus="clear_input_pass(this,'Nové heslo...')" onblur="fil_input_pass(this,'Nové heslo...')"/>
		<input type="text" name="reset_pwd2" id="reset_pwd2" value="Nové heslo ešte raz..."  onfocus="clear_input_pass(this,'Nové heslo ešte raz...')" onblur="fil_input_pass(this,'Nové heslo ešte raz...')"/>
		<p></p><p></p><p></p>
		<a href="javascript:void(0)" class="button" id="login_button" onClick="change_lost_password('Nové heslo...');">Zmeniť</a>
	</div>
</div>

<?php
		}
	}
}else{
?>
<script>//window.location.replace("?");</script>
<?php
}
?>