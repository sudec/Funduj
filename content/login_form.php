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
			<a href="javascript:void(0)" class="button" id="login_button" onClick="formhash1(document.loginform);">Prihlásiť</a>
		</div>
		<div class="left" style="margin-left: 25px;">
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
	<div class="left" style="margin-left: 25px;">
		<div id="register" class="register_window">
			<form name="register_form" class="register_form" id="register_form" action="" method="post">
				<h1>Registrácia	</h1>
				<hr style="	margin-bottom: 30px;">
				<input type="text" name="user_name_reg" id="user_name_reg" value="Meno..."  onfocus="clear_input(this,'Meno...')" onblur="fil_input(this,'Meno...')"/>
				<input type="text" name="pass_reg" id="pass_reg" value="Heslo..." onfocus="clear_input_pass(this,'Heslo...')" onblur="fil_input_pass(this,'Heslo...')"/>
				<input type="text" name="pass2_reg" id="pass2_reg" value="Heslo ešte raz..." onfocus="clear_input_pass(this,'Heslo ešte raz...')" onblur="fil_input_pass(this,'Heslo ešte raz...')"/>
				<input type="text" name="email_reg" id="e_mail_reg" value="E-mail..."  onfocus="clear_input(this,'E-mail...')" onblur="fil_input(this,'E-mail...')"/>
				<a href="javascript:void(0)" class="button" id="register_button" style="margin-top:20px;" onClick="javascript:validate_user(new Array('Meno...','Heslo...','Heslo ešte raz...','E-mail...'));">Registrovať</a>
			</form>
		</div>
	</div>
</div>
					
<?php
}else{
?>
<script>//window.location.replace("?");</script>
<?php
}
?>