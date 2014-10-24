<?php require_once($_SERVER['DOCUMENT_ROOT'].'/modules/encrypt.php'); ?>
<div id="project">
		<div class="left">
			<div class="main_image_holder">
				<div class="main_project_image">
					<?php echo("<img src='files/".$_GET['id']."/img/".$project->project_image."'>"); ?>
				</div>			
				<div class="slider">
					<div class="carousel">
						<div class="main">
							<div class="left_arrow">
								<img src="../img/left_carousel_arrow.png">
							</div>
							<div class="holder">

							</div>
							<div class="right_arrow">
								<img src="../img/right_carousel_arrow.png">
							</div>
						</div>
					</div>
					<script>carousel_populate_images();</script>
				</div>
			</div>
			<div class="description">
				<?php echo html_entity_decode($project->project_description); ?>
			</div>
		</div>
		<div class="right">
			<div class="funding_overview">
				<div class="content">
					<h2>Vyzbieraných</h2><h1><?php echo $total_amount_pledged; ?> z <?php echo $project->pledge_amount; ?> €</h1>
					<h2>Ostáva</h2><h1><?php echo $days_remaining;?></h1>
					<h2>Doteraz</h2><h1><?php echo $total_backers." ".spravne_cislovanie($total_backers, "podporil", "podporili", "podporilo");?></h1>
					<hr>
					<?php 
					if (!$ended){
						$title=encrypt($award['title']);
						$id=encrypt($project->id);
					echo ("<a id='back_project".$i."' href='?opt=back&ttl=".$title."&aaid=".$id."'>");
					?>
							<div id="back_project_main_button" class="button">Podporiť</div>
						</a>
					<?php 
					}else{
					?>
					<div class="button_disabled" title="Tento projekt bol ukončený">Podporiť</div>
					<?php
					}
					?>
				</div>
			</div>
			<div class="author_overview">
				<div class="content">	
					<div class="top">
						O autorovi
					</div>
					<div class="midle">
						<div class="image"><img src="users/<?php echo $project->userID ?>/img/<?php echo $project->author_img ?>"></div>
						<div class="image_right">
							<p><?php echo  $project->author; ?> <?php //echo  $usr->lastname; ?></p>
							<p><?php echo  $project_by_this_user; echo spravne_cislovanie($project_by_this_user, " projekt", " projekty", " projektov");?></p>
							<p><?php echo  $project_backed_by_thi_user; echo spravne_cislovanie($project_backed_by_thi_user, " podporený", " podporené", " podporených");?></p>
						</div>
					</div>
					<a href="<?php echo  $usr->FB_account; ?> " target="_blank"><p style="margin-top:15px;"><i class="fa fa-facebook"></i> Facebook</p></a>
					<hr>
					<p style="margin-bottom:25px;"><a href="http://<?php echo  $usr->web_page; ?>" target="_blank"><?php echo  $usr->web_page; ?></a></p>
					<div class="button" id="contact_author_button">
						Kontaktovať autora
					</div>
				</div>
			</div>
				<?php
				$i=0;
				foreach ($results_awards as $award){
					$is_available = true;
					$rew_class="reward";
					$color="green";
					$delivery = sk_datum(strtotime($award['delivery_date']));
					if ($award['available']<=0){
						$available=" ";
					}
					else {
						$available=$award['available']-$award['backers']." z ".$award['available']." dostupných";
						if ($award['available']==$award['backers']){
							$rew_class="reward_all_gone";
							$color="red";
							$is_available = false;
						}
					}
					if ($is_available==true && !$ended) {
						$amount=encrypt($award['amount']);
						$title=encrypt($award['title']);
						$id=encrypt($project->id);
						$award_id=encrypt($award['entryID']);
						echo ("<a id='back_project".$i."' href='?opt=back&amm=".$amount."&ttl=".$title."&aaid=".$id."&wrdid=".$award_id."'>");
					}
					echo("
					<div class='".$rew_class."'>
						<div class='content'>
							<h1>Prispieť ".$award['amount']."€</h1>
							 ".$award['description']."
							<hr>
							<h2>".$award['backers']." ".spravne_cislovanie($award['backers'], " príspevok", " príspevky", " príspevkov")."</h2>
							<hr>
							<p class='".$color."'>".$available."</p>
							<p>Dátum dodania: ".$delivery."</p>
						</div>
					</div>");
					if ($is_available==true && !$ended) {
						echo "</a>";
					}
				}
				?>
		</div>
		<!-- *************************  Cantact author popup *****************  -->
		<div id='contact_author_popup' class='contact_author_popup' style='display: none;'>
			<h1> Odoslať správu používateľovi <?php echo  $project->author; ?></h1>
			<input type="text" name="message_subject" id="message_subject" value="Predmet..."  onfocus="clear_input(this,'Predmet...')" onblur="fil_input(this,'Predmet...')"/>
			<textarea id="message_body"></textarea>
			<?php if (login_check($dbh) == true && isset($_SESSION['user_id'])) {?>
			<a href="javascript:void(0)" id="message_send_button" class="button" onClick="send_message(<?php echo $project->userID=$result['userID'];?>, <?php echo $_SESSION['user_id'];?>);">Odoslať</a>
			<?php } else {?>
			<p class="red">Pre posielanie správ musíte byť prihlásený</p>
			<?php }
			echo ("<p class='error1 red' id='error_author'>Text</p>");
			?>		
		</div>
		<!-- *************************   award popup *****************  -->
	</div>