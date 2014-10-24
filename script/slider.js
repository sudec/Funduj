function on_resize(div, width) {
	if (width < 960) {
		width = 960;
	}
	var unit = "px";
	var height = width / 2.5 - 1;
	$(div).css({
		"height": height + unit
	});
}

function add_images(sides, randomize) {
	if (randomize) {
		$("#slider img").remove();
	}
	if (sides < 960) {
		sides = 960;
	}
	sides = sides / 10;
	var unit = "px";
	var myimages = new Array();
	if (randomize) {
		$.ajax({
			url: 'script/php/slider_images.php',
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$("#slider").html("<div class='loader'><img src='img/ajax_loader_blue_64.gif'></div>");
			},
			error: function(error) {
				console.log(error);
				display_error_message("Nepodarilo sa nacitat obrazky", 1);
			},
			success: function(data) {
				$("#slider").html("");
				var myimages = data;
				if (randomize) {
					window.rnd_num = [];
				}
				for (var i = 1; i <= 40; i++) {
					if (randomize) {
						window.rnd_num[i] = Math.floor(Math.random() * Object.keys(myimages).length);
						if (i > 1) {
							if (window.rnd_num[i] == window.rnd_num[i - 1]) {
								window.rnd_num[i] = Math.floor((window.rnd_num[i] + Object.keys(myimages).length) / 2);
							}
						}
					}
					$('#slider').append('<img src="' + myimages[window.rnd_num[i]] + '">');
					$('#slider img').css({
						"height": sides + unit,
						"width": sides + unit
					});
				}
			}
		});
	} else {
		$('#slider img').css({
			"height": sides + unit,
			"width": sides + unit
		});
	}
}


/****************************    Functions carousel slide image ***********************/

function next_image() {
	console.log("next_image called");
	window.position = window.position - 1;
	var margin = 0;
	for (var i = 0; i <= window.image_num; i++) {
		margin = 120 * (i + window.position);
		$("#" + i).animate({
			"left": margin + "px"
		});
	}
	enable_arrows();
}

function prev_image() {
	console.log("prev_image called");
	window.position = window.position + 1;
	var margin = 0;
	for (var i = 0; i <= window.image_num; i++) {
		margin = 120 * (i + window.position);
		$("#" + i).animate({
			"left": margin + "px"
		});
	}
	enable_arrows();
}

/****************Used at page load to load the images to the slider *****************************/
function carousel_populate_images() {
	$(".holder img").remove();
	window.position = 0;
	var margin = 0;
	enable_arrows();
	window.image_num = galleryarray[2].length - 1;
	for (var i = 0; i <= window.image_num; i++) {
		margin = 120 * i;
		$(".holder").append('<img id="' + i + '" style="left:' + margin + 'px;" src="' + galleryarray[2][i] + '">');
	}
}

function enable_arrows() {
	if (window.position < 0) {
		$(".left_arrow_disable").switchClass("left_arrow_disable", "left_arrow");
		$(".left_arrow img").remove();
		$(".left_arrow").append('<img src="../img/left_carousel_arrow_enabled.png">');
		$(".left_arrow").on("click", function(e) {
			prev_image();
			e.stopImmediatePropagation();
			return false;
		});
	}
	if (window.position > (4 - galleryarray[2].length)) {
		$(".right_arrow_disable").switchClass("right_arrow_disable", "right_arrow");
		$(".right_arrow img").remove();
		$(".right_arrow").append('<img src="../img/right_carousel_arrow_enabled.png">');
		$(".right_arrow").on("click", function(e) {
			next_image();
			e.stopImmediatePropagation();
			return false;
		});
	}
	if (window.position >= 0) {
		$(".left_arrow").off();
		$(".left_arrow").switchClass("left_arrow", "left_arrow_disable");
		$(".left_arrow_disable img").remove();
		$(".left_arrow_disable").append('<img src="../img/left_carousel_arrow.png">');
	}
	if (window.position <= (4 - galleryarray[2].length)) {
		$(".right_arrow").off();
		$(".right_arrow").switchClass("right_arrow", "right_arrow_disable");
		$(".right_arrow_disable img").remove();
		$(".right_arrow_disable").append('<img src="../img/right_carousel_arrow.png">');
	}
}

function show_carousel_main_img(img_id) {
	$(".main_project_image img").remove();
	$(".main_project_image").append('<img src="' + galleryarray[1][img_id] + '">');
}