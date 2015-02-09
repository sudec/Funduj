<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
$_SESSION['curent_new_project_ID']=$_GET['new_project_id']; ?>
<div class="newpr_left">
	
	<table class="newpr_table">
		<tr>
			<td>Názov Projektu</td>
			<td><input id="newpr_project_title_input" value="<?php echo($projects['project_title']); ?>" type="text" onkeyup="update_text(this,'#project_header','Názov projektu')"><br>Zadajte názov Vášho projektu. Názov projektu by mal byť výstižný a jednoznačne by mal popisovať Váš projekt</td> 
		</tr>
		<tr id="project_category_selector">
			<td>Obrázky k projektu</td>
			<td>
				<div id="fileuploader">Upload</div>
			</td>
		</tr>
		<?php
			$dir=$_SERVER['DOCUMENT_ROOT']."/files/".$_GET['new_project_id']."/img/";
			if (glob($dir.'{*.png,*.jpg,*.jpeg,*.gif}', GLOB_BRACE)){
			echo("<tr id='main_image_selector'>
					<td>Hlavný obrázok</td>
					<td><select id='new_projec_main_image' onchange='reload_project_image_view(this.value);'>
						<option>Vyberte obrázok</option>");	
					$pattern="(\.jpg$)|(\.png$)|(\.jpeg$)|(\.gif$)"; //valid image extensions
					$arr = array();
					if($handle = opendir($dir)) {
						while(false !== ($file = readdir($handle))){
							if(eregi($pattern, $file)){ //if this file is a valid image
								if ($projects['project_image']===$file){
									echo("<option value='".$file."' selected='selected'>".$file."</option>");
								}else
								{
									echo("<option value='".$file."'>".$file."</option>");
								}
							}
						}
						closedir($handle);
					}
				echo("</select></td></tr>");
			}
		?>
		<tr>
			<td>Kategória</td>
				<td><select id="newpr_project_category">
					<option value="0">Vyberte kategóriu</option>
					<?php
							foreach ($categories as $category){
								if ($category['ID']!='1' && $project->category!=$category['ID']){
									echo("<option value='".$category['ID']."'>".$category['name']."</option>");
								}
								if($project->category==$category['ID'] && $category['ID']!='1'){
									echo("<option value='".$category['ID']."' selected='selected'>".$category['name']."</option>");
								}
							}	
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td>Popis projektu</td>
			<td>
				<textarea id="newpr_project_short_description"  name="description" cols="35" rows="5" onkeyup="update_text(this,'#project_text','Sem príde popis Vášho projektu')"><?php echo($projects['short_description']); ?></textarea><br>
				Pár slovami popíšte Váš projekt. Tento pospis sa bude zobrazovat na hlavnej stranke.
			</td> 
		</tr>
		<tr>
			<td>Cieľová suma</td>
			<td><input id="newpr_project_pledge_amount" value="<?php echo($projects['pledge_amount']); ?>" type="text" onkeyup="update_text(this,'#project_amount','0 €')"><br>Cieľová suma by mala byť minimálna suma za ktorú schopný projekt uskutočniť.<br>
			Tiež nezabudnite že pri úspešnom projekte je z vyzbieranej čiastky účtovaný poplatok 4% za poskytnuté služby a 4% za transakčné poplatky. 
			</td> 
		</tr>
		<tr>
		<!--<tr>
			<td>Poštovné</td>
			<td><input id="newpr_project_shipping_cost" type="text" onkeyup="update_text(this,'#project_shipping','0 €')">
			Ak si želáte účtovať poštovné náklady zadajte ich cenu.
			</td> 
		</tr>
		<tr>
			<td>Dostupné v zahraničí</td>
			<td>
				<select id="newpr_project_shipping_abroad">
				<option value="1">Áno</option>
				<option value="0">Nie</option>
				</select>
			</td> 
		</tr>-->
		<tr>
			<td>Trvanie projektu</td>
			<td>45 dní</td> 
		</tr>
	</table>
	<div id="agree_box">
			<a href="javascript:void(0)" id="newpr_submit_base_information" onclick="save_base_info()"><div class="button">Ďalej</div></a>
			<a href="javascript:void(0)" id="newpr_save_base" onclick="save_base_info(true)"><div class="save_button" >Uložiť</div></a>
			
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
		<h1 id="project_header">
			<?php if($curentuser==1 && strlen($projects['project_title'])>1){echo($projects['project_title']);}else{ ?>Názov projektu<?php } ?></h1>
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
						<td id="project_amount"><?php if($curentuser==1 && strlen($projects['pledge_amount'])>1 ){echo($projects['pledge_amount']);}else{ ?>0<?php } ?> €</td>
						<td id="project_duration">45 dní</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="clear"></div>