<?php
if(login_check($dbh) != true) {
?>
<div id="signup" class="signup_window">
	<form name="loginform" id="loginform" method="post">
		<div class="left">
			<h1>Prihlásenie	</h1>
			<hr style="	margin-bottom: 30px;"/>
			<input type="text" name="login_user_name" id="login_user_name" value="Meno..."  onfocus="clear_input(this,'Meno...')" onblur="fil_input(this,'Meno...')"/>
			<input type="password" name="login_password" id="login_password" value="Heslo..." onfocus="clear_input_pass(this,'Heslo...')" onblur="fil_input_pass(this,'Heslo...')" />
			<div id="sigup_remem">
				<input type="checkbox" name="remember" value="remember" id="remember"><label for="remember"><span></span>Zapamätať</label>
				<a href="javascript:void(0)">Zabudnuté heslo</a>
			</div>
			<a href="javascript:void(0)" class="button" onClick="formhash1(document.loginform);">Prihlásiť</a><span class="error1"></span>
		</div>
		<div class="right">
			<div class="social_login">
				<h1>Prihlásenie cez sociálne siete</h1>
				<hr style="	margin-bottom: 30px;"/>
				<a style="float:left;" onclick="getLoginStatus(true);">
					<div class="btn-fb-login">
						<span class="icon icon-fb"></span>
						<span class="title">Prihlásenie cez Facebook</span>
					</div>
				</a>
			</div>
		</div>
	</form>
</div>
<?php
}else{
?>
<script>//window.location.replace("?");</script>
<?php
}
?>