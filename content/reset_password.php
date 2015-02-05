<?php
if(login_check($dbh) != true) {
?>

<div id="signup" class="signup_window" style="width:300px;min-height:0px;">
	<div id="send_lost_pwd">
		<h1>Zabudnuté heslo</h1>
		<hr style="	margin-bottom: 30px;"/>
			<p>Zadajte používateľské meno a e-mailovú adresu uvedenú pri registrácii na ktorú Vám bude zaslaný link s pokynmi pre obnovu hesla.</p>
		<input type="text" name="reset_pwd_user" id="reset_pwd_user" value="Používateľské meno..."  onfocus="clear_input(this,'Používateľské meno...')" onblur="fil_input(this,'Používateľské meno...')"/>
		<input type="text" name="reset_pwd_mail" id="reset_pwd_mail" value="E-mail..."  onfocus="clear_input(this,'E-mail...')" onblur="fil_input(this,'E-mail...')"/>
		<p></p>
		<a href="javascript:void(0)" class="button" id="login_button" onClick="send_lost_password();">Odoslať</a>
	</div>
</div>

<?php
}else{
?>
<script>//window.location.replace("?");</script>
<?php
}
?>