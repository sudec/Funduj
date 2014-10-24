function getLoginStatus(user_action) {
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			// the user is logged in and has authenticated your
			// app, and response.authResponse supplies
			// the user's ID, a valid access token, a signed
			// request, and the time the access token 
			// and signed request each expire
			var uid = response.authResponse.userID;
			var accessToken = response.authResponse.accessToken;
					$.ajax({
						type: "POST",
						url: '/lib/login.php',
						data: {
							fb_login: "true",
							id: response.authResponse.userID
						},
						error: function(obj, text, error) {
							msg = "Pri prihlasovaní sa vyskytla chyba";
							display_error_message(msg, 1);
						},
						success: function(response) {
							console.log(response);
							location.reload();
						}
					});
			
		} else if (response.status === 'not_authorized' & user_action===true) {
			// the user is logged in to Facebook, 
			// but has not authenticated your app
			FBlogin();
		} else {
			// the user isn't logged in to Facebook.
		}
	});
}

function FBlogin() {
	FB.login(function(response) {
		if (response.authResponse) {
			FB.api('/me', function(response) {
					$.ajax({
						type: "POST",
						url: '/lib/login.php',
						data: {
							fb_register: "true",
							email: response.email,
							first_name: response.first_name,
							last_name: response.last_name,
							id: response.id
						},
						error: function(obj, text, error) {
							msg = "Pri prihlasovaní sa vyskytla chyba";
							display_error_message(msg, 1);
						},
						success: function(response) {
							console.log(response);
							location.reload();
						}
					});
			});
		} else {
			console.log('User cancelled login or did not fully authorize.');
		}
	}, {scope: 'email'});
}