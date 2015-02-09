<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
$_SESSION['curent_new_project_ID']=$_GET['new_project_id']; ?>
<div class="newpr_left">
	<div id="awards_holder">
		<?php 
			if($awards_added==0){
		?>
		<script>window.count_of_awards=1;console.log(window.count_of_awards);</script>
		<div id="newpr_award_holder">
			<div id="nazov">
				<label for="name_1">Názov</label><input id="newpr_award_title" title="Zadajte krátky a výstižný názov tejto odmeny" class="1" type="text" name="nazov">
			</div>
			<div id="amount">
				<label for="amount_1">Suma</label><input title="Minimálna suma v eurách pre túto odmenu" type="text" id="newpr_award_amount" class="1 newpr_award_amount" name="amount">
			</div>
			<div id="description">
				<label for="description_1">Popis</label><textarea cols="55" id="newpr_award_description" title="Sem naíšte konkrétne čo dostane používateľ ktorý prispeje danú sumu k Vášmu projektu" class="1" rows="3" name="description"></textarea>
			</div>
			<div id="available">
				<label for="available_1">Dostupné</label><input title="Dostupný počet danej odmeny. Pre neobmedzený počet nechajte nevyplnené alebo zadajte 0" type="text" id="newpr_award_available" class="1" name="available">
			</div>
			<div id="datepicker_div">
				<label for="datum_1">Doba doručenia</label><input type="text" class="datepicker" id="delivery_date_1">
			</div>
		</div>
		<?php } 
		else
		{
			?><script>window.count_of_awards=<?php echo($number_of_curent_awards); ?>;console.log(window.count_of_awards);</script><?php
			foreach($all_awards as $award){
				echo("<div id='newpr_award_holder' class='".$award['awardID']."'>
						<div id='delete_button' class='".$award['awardID']."' onclick='delete_current_award(".$award['awardID'].")'><img src='img/delete.png'></div>
						<div id='nazov'>
							<label for='name_".$award['awardID']."'>Názov</label><input id='newpr_award_title' class='".$award['awardID']."' type='text' name='nazov' value='".$award['title']."'>
						</div>
						<div id='amount'>
							<label for='amount_".$award['awardID']."'>Suma</label><input type='text' id='newpr_award_amount' class='".$award['awardID']." newpr_award_amount' name='amount' value='".$award['amount']."'>
						</div>
						<div id='description'>
							<label for='description_".$award['awardID']."'>Popis</label><textarea cols='55' id='newpr_award_description' class='".$award['awardID']."' rows='3' name='description'>".$award['description']."</textarea>
						</div>
						<div id='available'>
							<label for='available_".$award['awardID']."'>Dostupné</label><input type='text' id='newpr_award_available' class='".$award['awardID']."' name='available' value='".$award['available']."'>
						</div>
						<div id='datepicker_div'>
							<label for='datum_".$award['awardID']."'>Doba doručenia</label><input type='text' class='datepicker' id='delivery_date_".$award['awardID']."' value='".$award['delivery_date']."'>
						</div>
					</div>");
			} 
		
		} ?>
	</div>		
	<div class="button" id="add_reward_button" style="float:left;" <?php if($awards_added!=0){echo("onclick='add_next_award(".$number_of_curent_awards.")'");}else{echo("onclick='add_next_award(1)'");} ?> >Pridať ďalšiu odmenu</div>
	<div class="clear"></div>
	<div id="agree_box">
			<a href="javascript:void(0)" id="newpr_submit_awards" <?php if($awards_added!=0){echo("onclick='save_awards(".$number_of_curent_awards.")'");}else{echo("onclick='save_awards(1)'");} ?>><div class="button">Ďalej</div></a>
			<a href="javascript:void(0)" id="newpr_save_awards" <?php if($awards_added!=0){echo("onclick='save_awards(".$number_of_curent_awards.")'");}else{echo("onclick='save_awards(1)'");} ?>><div class="save_button" >Uložiť</div></a>
			<a href="?opt=new_project&page=2&new_project_id=<?php echo $_GET['new_project_id']; ?>" id="newpr_submit_awards"><div class="button">Späť</div></a>
	</div>
</div>
<div class="newpr_right">
	<div class="help">
		<div class="text">
			<h1>
				Potrebujete poradiť?
			</h1>
			Pozrite si časť <a href="javascript:void(0)">Typy pri vytváraní projektov</a> . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.
		</div>
	</div>
	<div class="project">
		<div class="img_holder">
				<?php 
					if($curentuser==1 && strlen($project_image)>1){
						echo("<img src='files/".$_GET['new_project_id']."/img/thumb/thumb_".$project_image."'>");
					}else{ 
				?>
			<div class="text">
			Ešte ste nevybrali obrázok projektu. Po jeho výbere sa Vám zobrazí v tomto náhľade.
			</div>
				<?php } ?>		
		</div>
		<h1 id="project_header"><?php if($curentuser==1 && strlen($projects['project_title'])>1){echo($projects['project_title']);}else{ ?>Názov projektu<?php } ?></h1>
		<div class="project_content">
			<span id="project_text"><?php if($curentuser==1 && strlen($projects['short_description'])>1){echo($projects['short_description']);}else{ ?>Sem príde popis Vášho projektu<?php } ?></span>
		</div>
		<div class="progress_bar">
			<div class="progress_bar_overlay">
				
			</div>
		</div>
		<div class="project_footer">
			<table>
				<tbody>
					<tr>
						<td>Vyzbieranych</td>
						<td>Suma</td>
						<td>Do ukoncenia</td>
					</tr>
					<tr>
						<td>0%</td>
						<td id="project_amount"><?php if($curentuser==1 && strlen($projects['pledge_amount'])>1){echo($projects['pledge_amount']);}else{ ?>0<?php } ?> €</td>
						<td id="project_duration">0 dní</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="clear"></div>