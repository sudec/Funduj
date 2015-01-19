<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
$_SESSION['curent_new_project_ID']=$_GET['new_project_id']; ?>

<div class="newpr_editor_left">
	<textarea id="editor1" class="description" style="margin-bottom:20px;"><?php if ($curentuser==1 && strlen($project_description)>1){  echo (html_entity_decode($project_description,ENT_COMPAT,cp1251));} ?></textarea>
	<script>
		CKEDITOR.replace( 'editor1',{
			language:'sk',
			resize_enabled: false,
			"extraPlugins" : 'imagebrowser',
			"imageBrowser_listUrl" : "/script/php/ckedit_images_list.php"
		} );
	</script>
	<div id="agree_box">
			<a href="javascript:void(0)" id="newpr_submit_description" onclick="save_description()"><div class="button">Ďalej</div></a>
			<a href="javascript:void(0)" id="newpr_save_base" onclick="save_description(true)"><div class="save_button" >Uložiť</div></a>
			<a href="?opt=new_project&page=3&new_project_id=<?php echo $_GET['new_project_id']; ?>" id="newpr_submit_awards"><div class="button">Späť</div></a>
	</div>
</div>
<div class="newpr_right">
	<div class="help">
		<div class="text">
			<h1>
				Potrebujete poradiť?
			</h1>
			Pozrite si časť <a href="#">Typy pri vytváraní projektov</a> . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.
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
