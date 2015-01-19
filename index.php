<!DOCTYPE html>
<?php error_reporting(E_ERROR | E_WARNING | E_PARSE); 

		ob_start();?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
	<title>Funduj - Premen svoj sen na skutočnosť</title>
	<link href='//fonts.googleapis.com/css?family=Titillium+Web:400,300,600,700' rel='stylesheet' type='text/css'/>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" type="text/css" href="style/css/main.css"/>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" href="style/css/uploadfile.css"/>
	<link rel="stylesheet" href="/script/Scrollbars/jquery.mCustomScrollbar.css"/>
	<link rel="icon" 
      type="image/png" 
      href="/img/favicon.png" />
	<script type="text/javascript" src="/script/masonry.pkgd.js"></script>
	<script type="text/javascript" src="/script/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="/script/slider.js"></script>
	<script type="text/javascript" src="/script/jquery.bpopup.min.js"></script>
	<script type="text/javascript" src="/script/ie_jquery_document_size.js"></script>
	<script type="text/javascript" src="/script/functions.js"></script>
	<script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="/script/form_submit.js"></script>
	<script type="text/javascript" src="/script/sha512.js"></script>
	<script type="text/javascript" src="/script/jquery.mousewheel.js"></script>
	<!--<script type="text/javascript" src="/script/paypal.js"></script> -->
	<script type="text/javascript" src="/script/jquery.uploadfile.js"></script>
	<script type="text/javascript" src="/script/Scrollbars/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="/script/readmore.js"></script>
	<script type="text/javascript" src="/script/jquery.numeric.js"></script>
	<script type="text/javascript" src="/script/fb_script.js"></script>
	<script src=<?php echo("'script/php/getimages.php/?id=".$_GET['id']."'");?>></script>
	<?php
	require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
	require_once($_SERVER['DOCUMENT_ROOT'].'/lib/login.php');
	require_once($_SERVER['DOCUMENT_ROOT'].'/lib/session.php');
	require_once($_SERVER['DOCUMENT_ROOT'].'/script/php/functions.php');
	require_once $_SERVER['DOCUMENT_ROOT'].'/modules/project_management/new_project_functions.php';
	require_once $_SERVER['DOCUMENT_ROOT'].'/modules/project_management/project_related_functions.php';
	require_once($_SERVER['DOCUMENT_ROOT'].'/modules/encrypt.php');
	require('classes/session.class.php');
	sec_session_start();
	$_SESSION['open_project_id']=0;
	?>
	<?php
	if ($_GET['opt']!='new_project' && $_GET['opt']!='settings')
				{ 
	?>
	<script  type="text/javascript">
		$( window ).resize(function() {
			on_resize("#slider",document.body.clientWidth);//$( document ).width() used initialy insted of document.body.clientWidth
			add_images(document.body.clientWidth,false);
		});
		$(window).bind("load", function() {
  			var masonry_projects = new Masonry ('#projects_holder',{
			  columnWidth: 225,
			  itemSelector: '.project',
			  gutter: 20
			});
			on_resize("#slider",document.body.clientWidth);
			add_images(document.body.clientWidth,true);
		});
		(function($){
			$(window).load(function(){
				$("#msg_navigation").mCustomScrollbar(
					{theme:"3d-dark"}
				);
				$("#msg_body").mCustomScrollbar(
					{theme:"3d-dark"}
				);
			});
		})(jQuery);

	</script>
	
	<?php } 
	$_SESSION['last_uri'] = $_SESSION['cuurent_uri'];
	$_SESSION['cuurent_uri'] = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
	?>
</head>
<body>
	<div id="fb-root"></div>
	<!-- *************************   Facebook Javascript API *****************  -->
    <script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '318947478265708',
          xfbml      : true,
          version    : 'v2.0'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
    </script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
	<!-- *************************   Facebook Javascript API END*************  -->
	<div class="wrapper">
		<div id='top'>
			<div id='top_center'>
				
				<div id="top_menu">
					<a href="/" style="border:none;"><img src="img/logo.png" id="logo" alt="Logo" /></a>
					<a href="?opt=new_project&amp;page=1" class="menu">Nový projekt</a><!--  need to remove white space to prevent space between inline-blocks
	    		 --><a href="?opt=how_it_works"  class="menu">Ako to funguje</a>
				</div>
				<div id='top_buttons'>
					<!--  syntax for the login button assures the JS popup	/ -->
					<?php 
						if(login_check($dbh) == true) {
							$read_status=0;
							if ($new_messages =	$dbh->prepare("SELECT * FROM ".$table_prefix."_messages WHERE to_user = ? AND read_status = ?")){
								$new_messages->bindParam('1',$_SESSION['user_id'], PDO::PARAM_STR);
								$new_messages->bindParam('2',$read_status, PDO::PARAM_STR);
								$new_messages->execute();
								$new_messages1=$new_messages->fetchAll(PDO::FETCH_ASSOC);
								$new_messages_count=$new_messages->rowCount();
								
								if ($new_messages_count >= 1){
									echo "<div class='unread_messages'>".$new_messages_count."</div>";
								}
							}
							echo "<a id='user_name_main' class='button'>".$_SESSION['username']."</a><a href='/lib/logout.php' id='' class='button'>Odhlásiť</a>";
							if ($projects =	$dbh->prepare("SELECT projectID, project_title, approved, status, last_page_filled FROM ".$table_prefix."_projects WHERE userID = ?")){
								$projects->bindParam('1',$_SESSION['user_id'], PDO::PARAM_STR);
								$projects->execute();
								$fetchedProjects=$projects->fetchAll(PDO::FETCH_ASSOC);
							}
							?>
							<div id='userbox'>
								<div id="userbox_inner">
									<div class="left">
										<h1>
											Môj účet
										</h1>
										<!--<p><i class="fa fa-users"></i> Aktivity</p>-->
										<p><a href="?opt=msg"><i class="fa fa-envelope-o"></i> Pošta (<?php echo $new_messages_count ;?>)</a></p>
										<!--<p><i class="fa fa-eye"></i> Prezrené projekty</p>
										<p><i class="fa fa-user"></i> Osobné údaje</p>-->
										<p><a href="?opt=settings"><i class="fa fa-wrench"></i> Nastavenia</a></p>
									</div>
									<div class="right" style="margin-bottom:15px">
										<h1>Projekty</h1>
										<h2>Vytvorené projekty</h2>	
											<?php	if ($projects->rowcount()>0){
														foreach ($fetchedProjects as $projekt){
															if (!$projekt['approved']){
																echo("<span><a href='?opt=new_project&amp;page=".$projekt['last_page_filled']."&amp;new_project_id=".$projekt['projectID']."'>".$projekt['project_title']."</a></span>");
															}else
															{
																$approved_projects=$approved_projects+1;
															}
														}
													}
													else{
														echo("<span>Zatiaľ ste nevytvorili žiadny projekt.</span>");
													}
											?>
											<?php	if ($projects->rowcount()>0 && $approved_projects>0){
												echo("<h2>Schválené projekty</h2>");
														foreach ($fetchedProjects as $projekt){
															if ($projekt['approved']){
																echo("<span><a href='?opt=project&id=".$projekt['projectID']."'>".$projekt['project_title']."</a></span>");
															}
														}
													}
													else{
														echo("<span>Zatiaľ ste nevytvorili žiadny projekt.</span>");
													}
											?>
										<h2>Podporené projekty</h2>
										<?php	
												if ($projects =	$dbh->prepare("SELECT DISTINCT(".$table_prefix."_backing.projectID) , project_title, approved FROM "
																			  .$table_prefix."_backing INNER JOIN ".$table_prefix."_projects "
																			  ."ON ".$table_prefix."_backing.projectID=".$table_prefix."_projects.projectID  "
																			  ."WHERE backer_ID=? AND confirmed=1 ORDER BY ".$table_prefix."_backing.projectID")){
													$projects->bindParam('1',$_SESSION['user_id'], PDO::PARAM_STR);
													$projects->execute();
													$fetchedProjects=$projects->fetchAll(PDO::FETCH_ASSOC);
												}
												if ($projects->rowcount()>0){
														foreach ($fetchedProjects as $projekt){
															if ($projekt['approved']){
																echo("<span><a href='?opt=project&id=".$projekt['projectID']."'>".$projekt['project_title']."</a></span>");
															}
														}
													}
													else{
														echo("<span>Zatiaľ ste nepodporili žiadny projekt.</span>");
													}
										?>
									</div>
								</div>
							</div>
							<?php
						} 
						else{
							echo "<a id='signup_go' name='signup' href='?opt=login' class='button signin_button'>Prihlásenie / Registrácia</a>";
						}
					 ?>
				</div>
			</div>
		</div>
		<?php 
				if ($_GET['opt']=='project' || $_GET['opt']=='project_filter' || $_GET['opt']=='faq' || !isset($_GET['opt']) || (($_GET['opt'])=='login' && login_check($dbh) == true))
				{ ?>	
							<div id="slider">
							</div>
				
		<?php }
			?>	
		<div id="main_content" >
			<div class="message_holder" id="error_message_holder">
			</div>
			<?php 
				if($_GET['opt']=='new_project')
				{
					include('content/new_project.php');
				}
				elseif ($_GET['opt']=='project')
				{
					include('content/project_view.php');
				}
				elseif($_GET['opt']=='project_filter'){
					include('content/projects.php');
				}
				elseif($_GET['opt']=='faq'){
					include('content/faq.php');
				}
				elseif($_GET['opt']=='settings'){
					include('content/settings.php');
				}
				elseif($_GET['opt']=='pravidla'){
					include('content/pravidla.php');
				}
				elseif($_GET['opt']=='privacy'){
					include('content/privacy.php');
				}
				elseif($_GET['opt']=='msg'){
					if (login_check($dbh) == true){
						include('modules/messaging/messages_view.php');
					}else{
						
						include('content/login_form.php');	
					}
				}
				elseif($_GET['opt']=='back'){
					include('content/back_project.php');
				}
				elseif($_GET['opt']=='wire_trans'){
					include('content/wire_trans.php');
				}
				elseif(($_GET['opt'])=='conf'){
					include('modules/user_management/confirm_user.php');
				}
				elseif(($_GET['opt'])=='login' && login_check($dbh) == false){
					include('content/login_form.php');
				}
				elseif(($_GET['opt'])=='res_pwd' && login_check($dbh) == false){
					include('content/reset_password.php');
				}
				elseif(($_GET['opt'])=='lost_pwd' && login_check($dbh) == false){
					include('content/new_password.php');
				}
				elseif(($_GET['opt'])=='how_it_works'){
					include('content/akonato.php');
				}
				elseif(($_GET['opt'])=='about'){
					include('content/about.php');
				}
				elseif(($_GET['opt'])=='contact'){
					include('content/contact.php');
				}
				elseif(($_GET['opt'])=='coop'){
					include('content/coop.php');
				}
				else{
					include('content/projects.php');
				}
			?>				
		</div>

		<div class="push"></div>
	</div>
    <div class="footer">
		<div class="content">
			<div class="column1">
				<h1>
					Kategórie
				</h1>
				<a href="?opt=project_filter&cat=34">Umenie</a> <br> <a href="?opt=project_filter&cat=35">Film </a><br><a href="?opt=project_filter&cat=42">Design</a><br><a href="?opt=project_filter&cat=38">Fotografia </a><br><a href="?opt=project_filter&cat=39">Literatúra </a><br><a href="?opt=project_filter&cat=36">Hudba</a>
			</div>
			<div class="column2">
				<a href="?opt=project_filter&cat=40">Šport </a><br> <a href="?opt=project_filter&cat=41">Hry </a><br><a href="?opt=project_filter&cat=37">Tehcnológie </a><br> <a href="?opt=project_filter&cat=43">Jedlo</a><br><a href="?opt=project_filter&cat=44">Móda</a><br><a href="?">Všetko</a>
			</div>
			<div class="column">
				<h1>
					O Nás
				</h1>
				<a href="?opt=about">O Nás</a> <br> <a href="?opt=contact">Kontakt</a> <br><a href="?opt=coop">Spolupráca </a><br>	
			</div>
			<div class="column">
				<h1>
					Pomoc
				</h1>
				<a href="?opt=faq">FAQ</a> <br><a href="?opt=how_it_works"> Ako na to</a> <br><a href="?opt=pravidla">Podmienky používania</a>  <br> <a href="?opt=privacy">Ochrana osobných údajov</a> 
			</div>
			<div class="column">
				<h1>
					Nájdete nás
				</h1>
				<i class="fa fa-facebook"></i>  Facebook <br>  <a href="https://twitter.com/Funduj"><i class="fa fa-twitter"></i>  Twitter </a><br> <i class="fa fa-google-plus"></i>   google+ <br>	<a href="http://funduj.tumblr.com/"><i class="fa fa-tumblr"></i>  tumblr. </a><br> <i class="fa fa-youtube"></i>  youtube
			</div>
			<div class="design">
				Web by WebVibes
			</div>
		</div>
    </div>
</body>
</html>