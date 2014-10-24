//Submiting the login form with this function

function formhash1(form) {
	//form.serialize();
	username = document.getElementById("login_user_name").value;
	password = document.getElementById("login_password").value;
	passtosubmit = hex_sha512(password);
	// Create a new element input, this will be out hashed password field.
	var p = document.createElement("input");
	// Add the new element to our form.
	//form.appendChild(p);
	//p.name = "p";
	//p.type = "hidden";
	//p.value = passtosubmit;
	// Make sure the plaintext password doesn't get sent.
	passtosubmit.value = "";
	data="&login_user_name=" + encodeURIComponent(username) + "&p=" +encodeURIComponent(passtosubmit) + "&action=login";
	// Finally submit the form.
	//form.submit();
	$.ajax({
		type: "POST",
		url: '/lib/login.php',
		data: data,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj,text,error){
			$(".error1").css("visibility", "visible");
			$(".error1").css("color", "red");
			$(".error1").text(obj.responseText);
			showNotice("error",obj.responseText);
		},
		success: function(response) {
			$(".error1").css("visibility", "visible");
			$(".error1").css("color", "green");
			$(".error1").text(response);
			location.reload().delay(5000);
		}
	});
}

//validate user name in form

function validate_user(defaults) {
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	hide_error_message();
	if ($("#user_name_reg").length > 0) {
		$(".error").css("visibility", "hidden");
		$(".error").text("");
		username = document.getElementById("user_name_reg").value;
		email=	document.getElementById("e_mail_reg").value;
		//check the lenght of the user name
		if (username.length <= 4 || username === defaults[0]) {
			display_error_message("Meno musí obsahovať aspoň 5 znakov",1);
			return false;
		} else {
			if ((document.getElementById("pass_reg").value).length <= 5 || document.getElementById("pass_reg").value === defaults[1]) {
				display_error_message("Heslo musí obsahovať aspoň 6 znakov",1);
				return false;
			} else
			if (document.getElementById("pass2_reg").value !== document.getElementById("pass_reg").value) {
				display_error_message("Heslá sa nezhodujú",1);
				return false;
			} else
			{
				if(!filter.test(email)){
					display_error_message("Prosím zadajte platnú e-mailovú adresu",1);
					return false;
				}else
				{
					hide_error_message();
					add_user();
				}
			}
		}
	}
}

function add_user() {
	//event.preventDefault();
	//Get the data from the submited form
	data = $("#register_form").serialize();
	password = document.getElementById("pass_reg").value;
	passtosubmit = hex_sha512(password);
	data += "&pass=" + encodeURIComponent(passtosubmit);
	password = "";
	$.ajax({
		type: "POST",
		url: '/modules/user_management/process_add_user.php',
		data: data,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj,text,error){
			$(".error").css("visibility", "visible");
			$(".error").text(obj.responseText);
		},
		success: function(response) {
			display_error_message("Ďakujeme za Váš záujem. Vaša registrácia bola úspešná. Na zadanú e-mailovú adresu održíte e-mail spolu s pokynmi pre aktiváciu Vášho konta.",0);
		}
	});
	//return false;
}



function add_category() {
	data = $("#categoryform").serialize();
	$.ajax({
		type: "POST",
		url: 'modules/category_management/process.php',
		data: data,
		beforeSend: function() {
			$('#progress').html("<img src='img/loading.gif' />");
		},
		success: function(html) {
			$('#contact_form').html("<div id='message'></div>");
			$('#message').html("<h2>Category added successfully!</h2>")
				.hide()
				.fadeIn(500, function() {
					$('#message');
				});
		}
	});
	//return false;
}

function post_my_form(formid, where) {
	data = $(formid).serialize();
	$.ajax({
		type: "POST",
		url: where,
		data: data,
		beforeSend: function() {
			$('#progress').html("<img src='img/loading.gif' />");
		},
		success: function(html) {
			$('#progress').html(html)
			//$('#progress').html("<h3>User updated!</h3>")
			.hide()
				.fadeIn(500, function() {
					$('#message');
				});
		}
	});
	//return false;
}

function post_project_form(formid, where) {
	data = $(formid).serialize();
	image = document.getElementById('project_image').value;
	duration = document.getElementById('duration').value;
	video = document.getElementById('project_video').value;
	data = data + "&project_image=" + image + "&project_duration=" + duration + "&project_video=" + video;
	$.ajax({
		type: "POST",
		url: where,
		data: data,
		beforeSend: function() {
			$('#progress').html("<img src='img/loading.gif' />");
		},
		success: function(html) {
			$('#progress').html(html)
			//$('#progress').html("<h3>User updated!</h3>")
			.hide()
				.fadeIn(500, function() {
					$('#message');
				});
		}
	});
	//return false;
}