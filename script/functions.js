$(document).ready(function() {
	
	var masonry_projects = new Masonry ('#projects_holder',{
			  columnWidth: 225,
			  itemSelector: '.project',
			  gutter: 20
			});
			on_resize("#slider",document.body.clientWidth);
			add_images(document.body.clientWidth,true);

	//Used to check whether user agreed with terms and conditions when creating a new project
	$('#newpr_agree_with_conditions').click(function() {
		return false;
	});
	$('#newpr_agree_checkbox').click(function() {
		if (!$(this).is(':checked')) {
			$('#newpr_agree_with_conditions').bind('click', function() {
				return false;
			});
			$('#newpr_agree_with_conditions').removeClass('button').addClass('button_disabled');
			$('#newpr_agree_with_conditions').attr("title", "Pre pokračovanie musíte súhlasiť s podmienkami");
		} else {
			$('#newpr_agree_with_conditions').unbind('click');
			$('#newpr_agree_with_conditions').removeClass('button_disabled').addClass('button');
			$('#newpr_agree_with_conditions').removeAttr("title");
		}
	});
	//eneblaes tooltip on page. 
	$(function() {
		$(document).tooltip();
	});

	$('#back_project_main_button').click(function() {
		$('.back_project_popup').bPopup({
			positionStyle: 'fixed'
		});
		$('#error_back_project').text("");
		$('#error_back_project').css("visibility", "hidden");
	});
	//*************************************
	$('#other_award_amount_radio').click(function() {
		$('#award_select').append("<input type='text' id='other_award_value'>");
	});
	$('.radio_award_select_cls').click(function() {
		$('#other_award_value').remove();
	});

	//*************************************
	$('#contact_author_button').click(function() {
		$('.contact_author_popup').bPopup({
			positionStyle: 'fixed'
		});
		$('#error_author').css("visibility", "hidden");
		$("#error_author").attr("class", "error1 red");
		$("#message_subject").val("Predmet...");
		$("#message_body").val("Sprava...");
	});

	/**********   Event handler for carousel in project detail view ********************/

	$('.carousel .holder img').on('click', function() {
		show_carousel_main_img(this.id);
	});


	/* Clear the register form when the register button is clicked 
	$("#register_button").click(function() {
		$("#user_name_reg").val("Meno...");
		$("#user_name_reg").css("color", "#ababab");
		$("#pass_reg").val("Heslo...");
		$("#pass_reg").attr("type", "text");
		$("#pass_reg").css("color", "#ababab");
		$("#pass2_reg").val("Heslo ešte raz...");
		$("#pass2_reg").attr("type", "text");
		$("#pass2_reg").css("color", "#ababab");
		$("#e_mail_reg").val("E-mail...");
		$("#e_mail_reg").css("color", "#ababab");
		$(".error").css("color", "red");
		$(".error").css("visibility", "hidden");
	});

 * Register Enter button 
 */
	$('#user_name_main').on('click', function() {
		$('#userbox').fadeToggle("fast");
	});

	$('#loginform input').keydown(function(e) {
	    if (e.keyCode == 13) {
	        formhash1(document.loginform);
	    }
	});

	$('#register_form input').keydown(function(e) {
	    if (e.keyCode == 13) {
	        validate_user(new Array('Meno...','Heslo...','Heslo ešte raz...','E-mail...'));
	    }
	});
        
        $('#reset_pwd input').keydown(function(e) {
	    if (e.keyCode == 13) {
	        change_lost_password('Nové heslo...');
	    }
	});

        $('#send_lost_pwd input').keydown(function(e) {
	    if (e.keyCode == 13) {
	        send_lost_password();
	    }
	});
	/********* Global variables ***********************/

	$("#fileuploader").uploadFile({
		url: "/lib/fileupload/upload.php",
		allowedTypes: "png,gif,jpg,jpeg",
		multiple: false,
		fileName: "myfile",
		maxFileCount: 2,
		onSuccess: function(files, data, xhr) {
			add_image_selector_dropdown(files);
		}
	});

	$("#fileuploader2").uploadFile({
		url: "/lib/fileupload/upload.php",
		allowedTypes: "png,gif,jpg,jpeg",
		multiple: false,
		fileName: "myfile",
		maxFileCount: 2,
		onSuccess: function(files, data, xhr) {
			change_settings_picture(files);
		}
	});

	$('#newpr_user :input').on('focus', function() {
		$(this).css('background-color', 'white');
	});
	/******************   Verify if input contains only numbers ************************/
	$('input#newpr_project_pledge_amount').on('focusout', function() {
		if (!$.isNumeric(this.value)) {
			this.value = " ";
			alert("Cieľová suma musí byť čislo vačšie ako 0");
		}
	});

	$(function() {
		$("#accordion").accordion();
	});

	$('.payment_content').readmore({
		maxHeight: 60,
		moreLink: '<a href="#">Čítať viac</a>',
		lessLink: '<a href="#">Menej</a>'
	});

	/**** Function to select active selected reward *******/
	$('.back_project_payment').click(function(e) {
		hide_error_message();
		if ($(e.target).is('.readmore-js-toggle')) {
			e.preventDefault();
			return;
		}
		var id = $(this).attr('id');
		$("#award_" + id).prop("checked", true);
		$(".active").toggleClass("active");
		$("#" + id + ".reward_payment").toggleClass("active");
		var myAward = JSON.parse($("#award_" + id).val());
		$('#minimal_pledge_value').html(myAward.award_min_val);
		$('input[name=item_name]').val(myAward.award_title);
		$('input[name=item_number]').val(myAward.award_id);
		$('input[name=amount]').val(myAward.award_min_val);
		$('input[name=custom]').val("project_id=" + myAward.project_id + "&user_id=" + myAward.user_id + "&award_id=" + myAward.award_id);
                $('#fund_amount').val(myAward.award_min_val);
	});

	$("input.fund_amount").numeric({
		negative: false
	});
	$("#newpr_project_pledge_amount").numeric({
		negative: false
	});
	$(".newpr_award_amount").numeric({
		negative: false
	});
	$("#phone").numeric({
		negative: false
	});

	$("#wire .button").click(function(e) {
		if (!$("input[name='award_select']:checked").val()) {
			msg = "Prosím vyberte si jednu z odmien. V prípade ak si neželáte obdržať odmenu vyberte možnosť \"Bez odmeny!\"";
			display_error_message(msg, 1, 4);
			e.preventDefault();
			return;
		}
		if (parseFloat($('.fund_amount').val()) < 1 || isNaN(parseFloat($('.fund_amount').val()))) {
			msg = "Príspevok musí byť v minimálnej výške 1.00 €";
			display_error_message(msg, 1, 4);
			e.preventDefault();
			return;
		}
		var params = JSON.parse($('input[name=award_select]:checked').val());
		if (parseFloat(params.award_min_val) > parseFloat($('.fund_amount').val())) {
			msg = "Vybraná odmena vyžaduje minimálny príspevok v hodnote " + params.award_min_val + " €";
			display_error_message(msg, 1, 4);
			e.preventDefault();
			return;
		}
		var public_backing = $('#public_backing_chckbx').prop('checked');
		window.location.href = '?opt=wire_trans&project_id=' + params.project_id + "&amount=" + parseFloat($('.fund_amount').val()).toFixed(2) + "&award_id=" + params.award_id+"&public=" + public_backing;
	});


	$(".paypal_button").click(function(e) {
		if (!$("input[name='award_select']:checked").val()) {
			msg = "Prosím vyberte si jednu z odmien. V prípade ak si neželáte obdržať odmenu vyberte možnosť \"Bez odmeny!\"";
			display_error_message(msg, 1, 4);
			e.preventDefault();
			return;
		}
		var params = JSON.parse($('input[name=award_select]:checked').val());
		if (parseFloat(params.award_min_val) > parseFloat($('.fund_amount').val())) {
			msg = "Vybraná odmena vyžaduje minimálny príspevok v hodnote " + params.award_min_val + " €";
			display_error_message(msg, 1, 4);
			e.preventDefault();
			return;
		}
		$("#paypal_form").submit();
	});
        
        


	/*******************************************************************/

	$("#submit_user_settings_form").click(function(e) {
		data = $("form#user_settings").serialize();
		password = document.getElementById("old_pass").value;
		old_pass_enc = hex_sha512(document.getElementById("old_pass").value);
		data += "&old_pass_enc=" + encodeURIComponent(old_pass_enc);
		new_pass_enc = hex_sha512(document.getElementById("new_pass").value);
		data += "&new_pass_enc=" + encodeURIComponent(new_pass_enc);
		data += "&option=2";
		password = "";
		$.ajax({
			url: 'modules/settings/user_settings.php',
			type: 'post',
			dataType: 'json',
			data: data,
			error: function(error) {
				console.log(error);
				display_error_message("Pri ukladaní sa vyskytla chyba. Prosím skúste znova neskôr", 1, 4);
			},
			success: function(data) {
				if (data.status === "error"){
					display_error_message(data.message, 1, 4);
					$("#old_pass").val("");
					$("#new_pass").val("");
					$("#new_pass2").val("");
				}
				else {
					display_error_message(data.message, 0, 4);
					$("#old_pass").val("");
					$("#new_pass").val("");
					$("#new_pass2").val("");
				}
			}
		});
		e.preventDefault(); //STOP default action
	});
        /***************************************************/
});
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/
/*************************************************************************************************************************************/

//used to hide the user panel div
$(document).mouseup(function(e) {
	var container = $("#userbox");
	var caller = $("#user_name_main");
	if (!container.is(e.target) && container.has(e.target).length === 0 && !caller.is(e.target)) // ... nor a descendant of the container
	{
		container.hide("fast");
	}
});
/*************************************************************************************************************************************/



function next_div(div, nextdiv) {

	$(div).detach();
	$(nextdiv).css("visibility", "visible");
}

function append_div(div) {
	$(div).after('.header');
}


//Updates text form "from" div in the "to" div. If there is no text in the from part the default text is used.

function update_text(from, to, default_text) {
	new_text = $(from).val();
	new_text = trim11(new_text);
	if (to === "#project_duration" && new_text !== "") {
		new_text = new_text + " dní";
	}
	if (to === "#project_amount" && new_text !== "") {
		new_text = new_text + " €";
	}
	$(to).text(new_text);
	if (new_text === "") {
		$(to).text(default_text);
	}
}

//Removes white space from the beggining and from end of string

function trim11(str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}



function clear_input(input, default_text) {
	if ($(input).val() === default_text) {
		$(input).val("");
		$(input).css("color", "#2b2b2b");
	}
}

function fil_input(input, default_text) {
	if ($(input).val() === "") {
		$(input).val(default_text);
		$(input).css("color", "#ababab");
	}
}

function clear_input_pass(input, default_text) {
	if ($(input).val() === default_text) {
		$(input).val("");
		$(input).css("color", "#2b2b2b");
		$(input).attr("type", "password");
	}
}

function fil_input_pass(input, default_text) {
	if ($(input).val() === "") {
		$(input).val(default_text);
		$(input).css("color", "#ababab");
		$(input).attr("type", "text");
	}
}
//Function to show and customize Datepicker
$(function() {
	$("input.datepicker").datepicker();
	$.datepicker.regional['sk'] = {
		closeText: 'Zavrieť',
		prevText: '&#x3c;Predchádzajúci',
		nextText: 'Nasledujúci&#x3e;',
		currentText: 'Dnes',
		monthNames: ['Január', 'Február', 'Marec', 'Apríl', 'Máj', 'Jún',
			'Júl', 'August', 'September', 'Október', 'November', 'December'
		],
		monthNamesShort: ['Jan', 'Feb', 'Mar', 'Apr', 'Máj', 'Jún',
			'Júl', 'Aug', 'Sep', 'Okt', 'Nov', 'Dec'
		],
		dayNames: ['Nedel\'a', 'Pondelok', 'Utorok', 'Streda', 'Štvrtok', 'Piatok', 'Sobota'],
		dayNamesShort: ['Ned', 'Pon', 'Uto', 'Str', 'Štv', 'Pia', 'Sob'],
		dayNamesMin: ['Ne', 'Po', 'Ut', 'St', 'Št', 'Pia', 'So'],
		weekHeader: 'Ty',
		dateFormat: 'dd.mm.yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	};
	$.datepicker.setDefaults($.datepicker.regional['sk']);
});

//adds next div for the new award

function add_next_award() {
	window.count_of_awards = window.count_of_awards + 1;
	next_id = window.count_of_awards;
	$("#awards_holder").append("<div id='newpr_award_holder' class='" + next_id + "'><div id='delete_button' class='" + next_id + "' onclick='delete_current_award(" + next_id + ")'><img src='img/delete.png'></div><div id='nazov'><label for='name'>Názov</label><input type='text' id='newpr_award_title' class='" + next_id + "'  name='nazov_" + next_id + "'></div><div id='amount'><label for='amount'>Suma</label><input type='text' id='newpr_award_amount' class='" + next_id + "' name='amount_" + next_id + "'></div><div id='description'><label for='description'>Popis</label><textarea cols='55' rows='3' id='newpr_award_description' class='" + next_id + "' name='description_" + next_id + "'></textarea></div><div id='available'><label for='available'>Dostupné</label><input id='newpr_award_available' class='" + next_id + "' type='text' name='available_" + next_id + "'></div><div id='datepicker_div'><label for=''>Doba doručenia</label><input type='text' class='datepicker' id='delivery_date_" + next_id + "'></div></div>");
	$("#add_reward_button").remove();
	$("#awards_holder").append("<div class='button' id='add_reward_button' style='float:left;' onclick='add_next_award(" + window.count_of_awards + ")'>Pridať ďalšiu odmenu</div>");
	$("input.datepicker").datepicker();
	$("#newpr_submit_awards").attr("onclick", "save_awards(" + window.count_of_awards + ")");
}

//adds fields for company information

function pravnicka_osoba() {
	if ($(".company").length === 0) {
		$(".meno").before("<div class='company'>" +
			"<input type='text' id='company' value='Názov spoločnosti' name='company' onfocus='clear_input(this, &apos;Názov spoločnosti&apos;),set_white_background(this)' onblur='fil_input(this,&apos;Názov spoločnosti&apos;)'>" +
			"</div>" +
			"<div class='ico'>" +
			"<input type='text' id='ICO' value='IČO' name='ico' onfocus='clear_input(this,&apos;IČO&apos;),set_white_background(this)' onblur='fil_input(this,&apos;IČO&apos;)'>" +
			"</div>" +
			"<div class='dic'>" +
			"<input type='text' id='DIC' value='DIČ/IČO DPH' name='dic' onfocus='clear_input(this,&apos;DIČ/IČO DPH&apos;),set_white_background(this)' onblur='fil_input(this,&apos;DIČ/IČO DPH&apos;)'>" +
			"</div>");
	}
	$(".error_user_details").remove();
}


//below function removes the specified fields from the user part of the new project addition

function fyzicka_osoba() {
	$(".company").remove();
	$(".ico").remove();
	$(".dic").remove();
	$(".error_user_details").remove();
}





// ************************     BELOW FUNCTIONS ARE USED DURING NEW PROJECT CREATION   *************************************/

function start_new_project() {
	if ($("#newpr_agree_checkbox").is(':checked')) {

		data = "option=1";
		$.ajax({
			type: "POST",
			url: '/modules/project_management/new_project_functions.php',
			data: data,
			async: false,
			beforeSend: function() {
				//$('#progress').html("<img src='img/loading.gif' />");
			},
			error: function(obj, text, error) {
				console.log(obj);
				console.log(text);
				console.log(error);
			},
			success: function(response) {
				$("#newpr_agree_with_conditions").prop("href", "?opt=new_project&page=2&new_project_id=" + response);
			}
		});
	}
}

function save_base_info(prompt_succes) {
	var project_title = $("#newpr_project_title_input").val();
	var project_category = $("#newpr_project_category").val();
	var short_description = $("#newpr_project_short_description").val();
	var pledge_amount = $("#newpr_project_pledge_amount").val();
	var project_duration = $("#newpr_project_duration").val();
	data = "option=2&project_title=" + project_title + "&new_project_id=" + $.getUrlVar('new_project_id') + "&project_duration=" + project_duration + "&project_category=" + project_category + "&short_description=" + short_description + "&pledge_amount=" + pledge_amount;
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: data,
		async: false,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj, text, error) {
			console.log(obj);
			console.log(text);
			console.log(error);
			console.log("error");
		},
		success: function(response) {
			$("#newpr_submit_base_information").prop("href", "?opt=new_project&page=3&new_project_id=" + $.getUrlVar('new_project_id'));
			if (prompt_succes === true) {
				msg = "Zmeny úspešne uložené";
				display_error_message(msg, 0, 4);
			}
		}
	});
}

function save_awards(award_num) {
	var award_title = [];
	var amount = [];
	var description = [];
	var available = [];
	var delivery = [];
	for (var i = 1; i <= window.count_of_awards; i++) {
		award_title[i] = $("#newpr_award_title." + i).val();
		amount[i] = $("#newpr_award_amount." + i).val();
		description[i] = $("#newpr_award_description." + i).val();
		available[i] = $("#newpr_award_available." + i).val();
		delivery[i] = $("#delivery_date_" + i + ".datepicker").val();
	}
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: {
			option: "3",
			new_project_id: $.getUrlVar('new_project_id'),
			award_num: window.count_of_awards,
			award_title: award_title,
			amount: amount,
			description: description,
			available: available,
			delivery: delivery
		},
		async: false,
		beforeSend: function() {

		},
		error: function(obj, text, error) {
			msg = "Pri ukladaní sa vyskytla chyba";
			display_error_message(msg, 1, 4);
		},
		success: function(response) {
			$("#newpr_submit_awards").prop("href", "?opt=new_project&page=4&new_project_id=" + $.getUrlVar('new_project_id'));
			msg = "Zmeny úspešne uložené";
			display_error_message(msg, 0, 4);
		}
	});

}

function delete_current_award(id) {
	var r = confirm("Skutočne si prajete túto odmenu odstrániť?");
	if (r === true) {
		$('#newpr_award_holder.' + id).remove();
		for (var i = id; i < window.count_of_awards; i++) {
			next_id = i + 1;
			$("#newpr_award_holder." + next_id).attr("class", i);
			$("#delete_button." + next_id).attr("class", i);
			$("#delete_button." + i).attr("onclick", "delete_current_award(" + i + ")");
			$("#newpr_award_title." + next_id).attr("class", i);
			$("#newpr_award_amount." + next_id).attr("class", i);
			$("#newpr_award_description." + next_id).attr("class", i);
			$("#newpr_award_available." + next_id).attr("class", i);
			$("#delivery_date_" + next_id + ".datepicker").attr("id", "delivery_date_" + i);
		}
		window.count_of_awards = window.count_of_awards - 1;
		$("#newpr_submit_awards").attr("onclick", "save_awards(" + window.count_of_awards + ")");
		$("#add_reward_button").attr("onclick", "add_next_award(" + window.count_of_awards + ")");
		$("#newpr_save_awards").attr("onclick", "save_awards(" + window.count_of_awards + ")");
	}
}


function reload_project_image_view(img) {
	$(".img_holder .text").remove();
	$(".img_holder img").remove();
	$('<img src="files/' + $.getUrlVar('new_project_id') + '/img/thumb/thumb_' + img + '">').appendTo(".img_holder");
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: {
			option: "5",
			new_project_id: $.getUrlVar('new_project_id'),
			project_image: img
		},
		async: false,
		error: function(obj, text, error) {
			console.log(obj);
			console.log(text);
			console.log(error);
			console.log("error");
		},
		success: function(response) {
			console.log(response);
		}
	});
}

function add_image_selector_dropdown(files) {
	if ($("#main_image_selector").length) {
		$('#new_projec_main_image').append(new Option(files, files));
	} else {
		$('#project_category_selector').after("<tr id='main_image_selector'>" +
			"<td>Hlavný obrázok</td>" +
			"<td><select id='new_projec_main_image' onchange='reload_project_image_view(this.value);'>" +
			"<option>Vyberte obrázok</option>" +
			"<option value='" + files + "'>" + files + "</option>" +
			"</select></td>" +
			"</tr>");
	}

}

function save_description(prompt_succes) {
	CKEDITOR.instances.editor1.updateElement();
	var project_description = document.getElementById('editor1').value;
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: {
			option: "6",
			new_project_id: $.getUrlVar('new_project_id'),
			project_description: project_description
		},
		dataType: 'html',
		async: false,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj, text, error) {
			console.log(obj);
			console.log(text);
			console.log(error);
			console.log("error");
		},
		success: function(response) {
			$("#newpr_submit_description").prop("href", "?opt=new_project&page=5&new_project_id=" + $.getUrlVar('new_project_id'));
			if (prompt_succes === true) {
				if (prompt_succes === true) {
					msg = "Zmeny úspešne uložené";
					display_error_message(msg, 0, 4);
				}
			}
		}
	});
}

function submit_project() {
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: {
			option: "8",
			new_project_id: $.getUrlVar('new_project_id')
		},
		dataType: 'html',
		async: false,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj, text, error) {
			console.log(obj);
			console.log(text);
			console.log(error);
			console.log("error");
			$("#newpr_submit_project").fadeOut(250);
			$(".confirm_submit").css("color", "Pri odosielaní sa vyskitla chyba.");
			$(".confirm_submit")
				.hide()
				.append("Ďakujeme. Projekt bol úspešne odoslaný na schválenie.\n V priebehu nasledujúcich pracovných dní Vás budeme kontaktovať.")
				.delay(250)
				.fadeIn(500);
		},
		success: function(response) {
			$("#newpr_submit_project").fadeOut(250);
			$(".confirm_submit")
				.hide()
				.append("Ďakujeme. Projekt bol úspešne odoslaný na schválenie.\n V priebehu nasledujúcich pracovných dní Vás budeme kontaktovať.")
				.delay(250)
				.fadeIn(500);
		}
	});
}

function validate_save_user_details(submit) {
	var valid = 1;
	if (!($('#fyzicka').is(':checked')) && !($('#pravnicka').is(':checked'))) {
		valid = 0;
		$(".error_user_details").remove();
		$("#div_fyzicka").before("<div class='error_user_details'>Prosím vyberte typ používatela</div>");
	} else {
		if ($("#name").val().length < 2 || $("#name").val() === 'Meno') {
			$("#name").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#lastname").val().length < 2 || $("#lastname").val() === 'Priezvisko') {
			$("#lastname").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#street_adress").val().length < 2 || $("#street_adress").val() === 'Ulica') {
			$("#street_adress").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#street_number").val().length < 2 || $("#street_number").val() === 'Číslo') {
			$("#street_number").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#city").val().length < 2 || $("#city").val() === 'Mesto') {
			$("#city").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#PSC").val().length < 2 || $("#PSC").val() === 'PSČ') {
			$("#PSC").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#phone").val().length < 2 || $("#phone").val() === 'Telefón') {
			$("#phone").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#email").val().length < 2 || $("#email").val() === 'E-mail') {
			$("#email").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#IBAN").val().length < 2 || $("#IBAN").val() === 'IBAN') {
			$("#IBAN").css("background-color", "#FFDADA");
			valid = 0;
		}
		if ($("#SWIFT").val().length < 2 || $("#SWIFT").val() === 'SWIFT') {
			$("#SWIFT").css("background-color", "#FFDADA");
			valid = 0;
		}
		if (!valid) {
			$(".error_user_details").remove();
			$("#contact_description_p").before("<div class='error_user_details'>Prosím opravte vyznačené polia.</div>");
		}
		if ($('#pravnicka').is(':checked')) {
			if ($("#company").val().length < 2 || $("#company").val() === 'Názov spoločnosti') {
				$("#company").css("background-color", "#FFDADA");
				valid = 0;
			}
			if ($("#ICO").val().length < 2 || $("#ICO").val() === 'IČO') {
				$("#ICO").css("background-color", "#FFDADA");
				valid = 0;
			}
			if ($("#DIC").val().length < 2 || $("#DIC").val() === 'DIČ/IČO DPH') {
				$("#DIC").css("background-color", "#FFDADA");
				valid = 0;
			}
		}
		// Validate IBAN
		$.ajax({
			type:"POST",
			url:'/script/php/functions.php',
			data:{
				option:"check_IBAN",
				IBAN: $("#IBAN").val()
			},
			dataType:'json',
			async:true,
			error: function(){},
			success: function(response){
				if (response.result){
					$("#IBAN").css("background-color", "#FFDADA");
					valid = 0;
				}else{
					$("#IBAN").val(response.human_IBAN);
					/*    SUBMIT the user details  *///
					if (valid) {
						$(".error_user_details").remove();
                                                if(submit){
                                                    save_user_details(true);
                                                }else{
                                                    save_user_details(false);
                                                }
					}
				}
				},
		});
	}
}

function validate_save_user_details_checkbox_check(){
    if ($("#newpr_agree_checkbox").prop('checked') && $("#newpr_agree_checkbox2").prop('checked')){
        validate_save_user_details(true);
    }else{
            display_error_message("Pre pokracovanie je potrebne aby ste suhlasili s podmienkami pouzivania a potvrdili spravnost vyplnenych udajov zaskrtnutim prislusnych poly",1, 4);
    }
}

function save_user_details(next) {
	var type = null;
	var company = null;
	var ICO = null;
	var DIC = null;
	if ($("#company").length) {
		type = 1;
		company = $("#company").val();
		ICO = $("#ICO").val();
		DIC = $("#DIC").val();
	} else {
		type = 0;
	}
	var name = $("#name").val();
	var lastname = $("#lastname").val();
	var street_adress = $("#street_adress").val();
	var street_number = $("#street_number").val();
	var city = $("#city").val();
	var PSC = $("#PSC").val();
	var phone = $("#phone").val();
	var email = $("#email").val();
	var IBAN = $("#IBAN").val();
	var SWIFT = $("#SWIFT").val();
	var account_number = $("#account_number").val();
	var bank_number = $("#bank_number").val();
	$.ajax({
		type: "POST",
		url: '/modules/project_management/new_project_functions.php',
		data: {
			option: "7",
			new_project_id: $.getUrlVar('new_project_id'),
			type: type,
			company: company,
			ICO: ICO,
			DIC: DIC,
			name: name,
			lastname: lastname,
			street_adress: street_adress,
			street_number: street_number,
			city: city,
			PSC: PSC,
			phone: phone,
			email: email,
			IBAN: IBAN,
			SWIFT: SWIFT,
			account_number: account_number,
			bank_number: bank_number
		},
		dataType: 'html',
		async: false,
		beforeSend: function() {
			//$('#progress').html("<img src='img/loading.gif' />");
		},
		error: function(obj, text, error) {
			console.log(obj);
			console.log(text);
			console.log(error);
			console.log("error");
		},
		success: function(response) {
			console.log(response);
                        if(next){
                            window.location.replace("?opt=new_project&page=6&new_project_id=" + $.getUrlVar('new_project_id'));
                        }
                        else{
                            display_error_message("Udaje boli uspesne ulozene",0,5);
                        }
			//$("#newpr_submit_user").prop("href", "?opt=new_project&page=6&new_project_id=" + $.getUrlVar('new_project_id'));
		}
	});
}

function disable_user_type() {
	$("#div_pravnicka").removeAttr("onclick");
	$("#div_fyzicka").removeAttr("onclick");
	document.getElementById("fyzicka").disabled = true;
	document.getElementById("pravnicka").disabled = true;
	$("#div_fyzicka").attr('title', 'Typ užívateľa už nie je možné zmeniť');
	$("#div_pravnicka").attr('title', 'Typ užívateľa už nie je možné zmeniť');
	$("#div_pravnicka").css('cursor', 'default');
	$("#div_fyzicka").css('cursor', 'default');
	$("#pravnicka").css('cursor', 'default');
	$("#fyzicka").css('cursor', 'default');
}

function set_white_background(div) {
	$(div).css('background-color', 'white');
}
/**************************     GETS the specified $_GET *******************************************/

$.extend({
	getUrlVars: function() {
		var vars = [],
			hash;
		var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		for (var i = 0; i < hashes.length; i++) {
			hash = hashes[i].split('=');
			vars.push(hash[0]);
			vars[hash[0]] = hash[1];
		}
		return vars;
	},
	getUrlVar: function(name) {
		return $.getUrlVars()[name];
	}
});

// *************************************************************************************************************************/

function send_mail() {
	from = $("#email").val();
	message = $("#question").val();
	if ($("#email").val() === '' || !$.trim($("#question").val())) {
		$("#error").text("Prosím vyplnte všetky polia.");
	} else {
		$.ajax({
			type: "POST",
			url: '/script/php/functions.php',
			data: {
				option: "send_mail",
				subject: "FAQ Question",
				from: from,
				message: message
			},
			dataType: 'html',
			async: false,
			error: function(obj, text, error) {
				console.log(obj);
				console.log(text);
				console.log(error);
				console.log("error");
			},
			success: function(response) {
				$("#error").remove();
				$("#submit_question").fadeOut(1500);
				$("#submit_question").remove();
				$("#mail_form").append("<p id='mail_sent'>Ďakujeme za Váš záujem. Vašu správu sme obdržali a odpovieme na ňu akonáhle to bude možné.</p>");
				$("#mail_sent").hide();
				$("#mail_sent").fadeIn(1500);
			}
		});
	}
}

/**********************************************************************/


/******************      Swicth procejt/comment / news part of a project **********************/
function switch_project_content(option) {
	$('#main_project_content_holder').html("<img src='../img/loader.gif' style='margin-left:380px;'>");
	if (option == 2) {
		$("#komentar").addClass('active');
		$("#projekt").removeClass('active');
		$("#novinky").removeClass('active');
		$("#backers").removeClass('active');
		$('#main_project_content_holder').load("/content/project_view_comment.php/?id=" + $.getUrlVar('id'), function() {
			$('#main_project_content_holder').fadeIn('fast');
		});
		scroolto("project_view_main");
		//$( "#main_project_content_holder" ).load( "/content/project_view_comment.php" );backers
	} else if (option == 3) {
		$("#komentar").removeClass('active');
		$("#projekt").removeClass('active');
		$("#novinky").addClass('active');
		$("#backers").removeClass('active');
		$('#main_project_content_holder').load("/content/project_view_novinky.php/?id=" + $.getUrlVar('id'), function() {
			$('#main_project_content_holder').fadeIn('fast');
		});
		scroolto("project_view_main");
		//$( "#main_project_content_holder" ).load( "/content/project_view_comment.php" );
	} else if (option == 4) {
		$("#komentar").removeClass('active');
		$("#projekt").removeClass('active');
		$("#novinky").removeClass('active');
		$("#backers").addClass('active');
		$('#main_project_content_holder').load("/content/project_view_backers.php/?id=" + $.getUrlVar('id'), function() {
			$('#main_project_content_holder').fadeIn('fast');
		});
		scroolto("project_view_main");
		//$( "#main_project_content_holder" ).load( "/content/project_view_comment.php" );
	} else {
		$("#main_project_content_holder").load("/content/project_view_project.php/?id=" + $.getUrlVar('id'));
	}

}

function sort_backers(object){
	$('#main_project_content_holder').html("<img src='../img/loader.gif' style='margin-left:380px;'>");
	$('#main_project_content_holder').load("/content/project_view_backers.php/?sort="+object.id+"&id=" + $.getUrlVar('id'), function() {
			$('#main_project_content_holder').fadeIn('fast');
		});
}

function add_comment() {
	var comment = $('#comment_body').val();
	var project_id = $.getUrlVar('id');
	if (comment.length < 1) {
		alert('Vyplnte prosím Váš komentár');
	} else {
		$.ajax({
			type: "POST",
			url: '/modules/messaging/messageing_functions.php',
			data: {
				option: "1",
				comment: comment,
				project_id: project_id
			},
			dataType: 'html',
			async: true,
			beforeSend: function(something) {
				$('#main_project_content_holder').html("<img src='../img/loader.gif' style='margin-left:380px;'>");
			},
			error: function(obj, text, error) {
				alert('Chyba pri pridavani');
			},
			success: function(response) {
				switch_project_content(2);
			}
		});

	}
}

function add_news() {
	var news = $('#news_body').val();
	var project_id = $.getUrlVar('id');
	var title = $('#news_header').val();
	if (news.length < 1) {
		alert('Vyplnte prosím text novinky');
	}
	if (title.length < 1) {
		alert('Vyplnte prosím názov novinky');
	} else {
		$.ajax({
			type: "POST",
			url: '/modules/messaging/messageing_functions.php',
			data: {
				option: "2",
				news: news,
				title: title
			},
			dataType: 'html',
			async: true,
			beforeSend: function(something) {
				$('#main_project_content_holder').html("<img src='../img/loader.gif' style='margin-left:380px;'>");
			},
			error: function(obj, text, error) {
				alert('Chyba pri pridavani');
			},
			success: function(response) {
				switch_project_content(3);
			}
		});

	}
}

function remove_news(news_id) {
	var r = confirm("Skutočne si želáte túto novinku odstrániť?");
	if (r === true) {
		$.ajax({
			type: "POST",
			url: '/modules/messaging/messageing_functions.php',
			data: {
				option: "3",
				news_id: news_id
			},
			dataType: 'html',
			async: true, //try to false if issues arise
			beforeSend: function(something) {
				$('#main_project_content_holder').html("<img src='../img/loader.gif' style='margin-left:380px;'>");
			},
			error: function(obj, text, error) {
				alert('Chyba pri mazani');
			},
			success: function(response) {
				switch_project_content(3);
			}
		});
	}
}

function send_message(to, from) {
	var subject = $('#message_subject').val();
	var message = $('#message_body').val();
	if (to === from) {
		$("#error_author").addClass("red");
		$('#error_author').text("Luťujeme ale nemožete poslať správu sebe");
		$('#error_author').css("visibility", "visible");
	} else {
		if (subject.length <= 1 || message.length <= 1) {
			$("#error_author").addClass("red");
			$('#error_author').text("Prosim vyplňte všetky polia");
			$('#error_author').css("visibility", "visible");
		} else {
			$('#error_author').css("visibility", "hidden");
			$.ajax({
				type: "POST",
				url: '/modules/messaging/messageing_functions.php',
				data: {
					option: "4",
					to: to,
					from: from,
					subject: subject,
					message: message
				},
				dataType: 'html',
				async: true,
				beforeSend: function(something) {
					$('#message_send_button').html("<img src='../img/gif_load_30px.gif'>");
				},
				error: function(obj, text, error) {
					$("#error_author").removeClass("green").addClass("red");
					$('#error_author').text("Pri odosielaní nastala chyba");
					$('#error_author').css("visibility", "visible");
				},
				success: function(response) {
					$('#message_send_button').html("Odoslať");
					$("#error_author").removeClass("red").addClass("green");
					$("#message_body").val("");
					$("#message_subject").val("Predmet...");
					$("#error_author").text("Vaša správa bola odoslaná!");
					$('#error_author').css("visibility", "visible");
					$("#error_author").attr("class", "error2 green");
                                        $("#contact_author_popup").bPopup().close();
                                        display_error_message("Vasa sprava bola odoslana",0,5);
				}
			});
		}
	}
}

function getmessagecontent(thread, msg) {
	$.ajax({
		type: "POST",
		url: '/modules/messaging/messageing_functions.php',
		data: {
			option: "6",
			thread: thread,
		},
		dataType: 'json',
		async: true,
		beforeSend: function(something) {
			$('#reply_message').val("");
			$('#mCSB_2_container').html("<img src='../img/loader.gif' style='margin-left:45%;margin-top:10%;'>");
			$(".active").removeClass("active");
			$("#msg_overview_" + msg).toggleClass("active");
			$("#msg_overview_" + msg).removeClass("unread");
			$("#msg_holder_title").text("");
		},
		success: function(response) {
			$("#msg_holder_title").text(response.subject);
			$("#mCSB_2_container").html(response.message);
			$("#button_holder").html("<div id='message_send_button' class='button' onclick='reply_message(" + response.sender + "," + response.curent_user + "," + thread + ")'>Odoslať</div>");
			console.log("called");
		}
	});
}

function reply_message(to, from, thread) {
	var message = $('#reply_message').val();
	var subject = $.trim($('#msg_holder_title').text());
	$.ajax({
		type: "POST",
		url: '/modules/messaging/messageing_functions.php',
		data: {
			option: "5",
			to: to,
			from: from,
			subject: subject,
			message: message,
			thread: thread
		},
		dataType: 'json',
		async: true,
		beforeSend: function(something) {
			$("#msg_holder_title").text("");
			$('#mCSB_2_container').html("<img src='../img/loader.gif' style='margin-left:45%;margin-top:10%;'>");
		},
		error: function(obj, text, error) {
			$('#error_author').text("Pri odosielaní nastala chyba");
			$('#error_author').css("visibility", "visible");
		},
		success: function(response) {
			$("#msg_holder_title").text(response.subject);
			$("#mCSB_2_container").html(response.message);
			$('#message_send_button').html("Odoslať");
			$('#reply_message').val("");
		}
	});
}
/**********************************************************************************************/

function scroolto(id) {
	// Scroll
	$('html,body').animate({
			scrollTop: $("#" + id).first().offset().top
		},
		'fast');
}


/**************************************************************************************************/

function display_error_message(msg, type) {
	//type:
	//1 - error (red)
	//0 - info (green)
	$(".message_holder").text(msg);
	$('.message_holder').show("fast");
	if (type === 1) {
		$('.message_holder').css("background-color", "#FFBFBF");
	}
	if (type === 0) {
		$('.message_holder').css("background-color", "#C8FFBD");
		$('.message_holder').delay(4000).hide("slow");
	}
	if (isScrolledIntoView(".message_holder") === false) {
		scroolto("error_message_holder");
	}
}

function display_error_message(msg, type, timeout) {
	//type:
	//1 - error (red)
	//0 - info (green)
        //*****************
        //timeout is provided in seconds
	$(".message_holder").text(msg);
	$('.message_holder').show("fast");
	if (type === 1) {
		$('.message_holder').css("background-color", "#FFBFBF");
	}
	if (type === 0) {
		$('.message_holder').css("background-color", "#C8FFBD");
		$('.message_holder').delay(timeout*1000).hide("slow");
	}
	if (isScrolledIntoView(".message_holder") === false) {
		window.scrollTo(0, 0);
	}
}

function hide_error_message() {
	$(".message_holder").text("");
	$('.message_holder').css("display", "none");
}

function isScrolledIntoView(elem) {
	var docViewTop = $(window).scrollTop();
	var docViewBottom = docViewTop + $(window).height();

	var elemTop = $(elem).offset().top;
	var elemBottom = elemTop + $(elem).height();

	return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

/***********************************************************/

function change_settings_picture(files) {
	$.ajax({
		type: "POST",
		url: '/modules/settings/user_settings.php',
		data: {
			option: "1",
			image: files[0],
		},
		dataType: 'json',
		async: true,
		error: function(response) {
			console.log(response);
		},
		success: function(response) {
			$("#usr_img").html("<img name=" + files + " id=" + files + " src='users/" + response.user_id + "/img/" + files + "'>");
		}
	});
}

function check_IBAN(input, default_text){
	if ($(input).val() === default_text) {
		/****************To be removed**********************/
		console.log("check_IBAN: default text was entered");
		/******************************************************/
		$(input).val("");
		$(input).css("color", "#2b2b2b");
	}else{
		//The below ajax part of the code causes issues
		if ($(input).val() === "") {
			/****************To be removed**********************/
			console.log("check_IBAN: empty text in IBAN field");
			/******************************************************/
			fil_input(input, default_text);
		}else{

				/****************To be removed**********************/
				console.log("check_IBAN: AJAX function called");
				/******************************************************/
			$.ajax({
				type:"POST",
				url:'/script/php/functions.php',
				data:{
					option:"check_IBAN",
					IBAN: $(input).val()
				},
				dataType:'json',
				async:true,
				error: function(){},
				success: function(response){
					if (response.result){
						display_error_message('Nesprávny IBAN',1,4);
					}else{
						$(input).val(response.human_IBAN);
					}

				},
			});
		}
	}
}

function send_lost_password(){
	var mail = $('#reset_pwd_mail').val();
	var username = $('#reset_pwd_user').val();
	$.ajax({
				type: "POST",
				url: '/lib/change_password.php',
				data: {
					option: "2",
					mail: mail,
					username: username
				},
				dataType: 'json',
				async: true,
				error: function(response) {
					console.log(response);
				},
				success: function(response) {
					console.log(response);
					if (response.status === 'error'){
						display_error_message(response.message, 1, 4);
					}else{
						display_error_message(response.message, 0, 15);
                                                $('#reset_pwd_mail').val("");
                                                $('#reset_pwd_user').val("");
					}
				}
	});
}

function change_lost_password(defaults_text){
	hide_error_message();
	var pass1 = $('#reset_pwd1').val();
	var pass2 = $('#reset_pwd2').val();
	var string = $.getUrlVar('dlksje');
	var new_pass_enc = hex_sha512(pass1);
	var new_pass_enc2 = hex_sha512(pass2);
	if ((document.getElementById("reset_pwd1").value).length <= 5 || document.getElementById("reset_pwd1").value === defaults_text) {
		display_error_message("Heslo musí obsahovať aspoň 6 znakov",1, 4);
		return false;
	}else{
		if (pass1 === pass2){
			$.ajax({
					type: "POST",
					url: '/lib/change_password.php',
					data: {
						option: "1",
						new_pass_enc: encodeURIComponent(new_pass_enc),
						new_pass_enc2: encodeURIComponent(new_pass_enc2),
						string: string
					},
					dataType: 'json',
					async: true,
					error: function(response) {
						console.log(response);
					},
					success: function(response) {
						console.log(response);
						if (response.status === 'error'){
							display_error_message(response.message, 1, 4);
						}else{
							display_error_message(response.message, 0, 15);
                                                        $('#reset_pwd1').val("");
                                                        $('#reset_pwd2').val("");
                                                        setTimeout(function(){
                                                            window.location.replace("?opt=login");
                                                       }, 3000); 
                                                        
						}
					}
			});
		}else{
			display_error_message("Heslá sa nezhodujú.", 1, 4);
			return false;
		}
	}
}