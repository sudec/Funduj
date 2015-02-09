<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
$_SESSION['curent_new_project_ID']=$_GET['new_project_id']; ?>
<div class="newpr_left">
	<div id="newpr_user">
		<form>
			<div class="newpr_user_type">
				<div class="heading">
					Používateľ
				</div> 
				<div class="content">
					<p>
						Prosím vyberte typ používateľa ktorému budú vyzbierané peniaze poslané. V prípade že sa jedná o Vás ako jednotlivca vyberte fyzická osoba. V prípade ak projekt zakladáte pre vašu firmu, resp. ak vystupujete ako fyzická osoba podnikateľ, vyberte možnosť právanická osoba. Po uložení údajov už nie je možné zmeniť typ používateľa.
					</p>
					<label for="fyzicka" class="label" id="div_fyzicka" onclick="fyzicka_osoba()">
						<input type="radio" name="user_type" value="fyzicka" id="fyzicka">  Fyzická osoba 
					</label>
					 <label for="pravnicka" class="label" id="div_pravnicka" onclick="pravnicka_osoba()">
						<input type="radio" name="user_type" value="pravnicka" id="pravnicka">  Právnická osoba 
					</label>
				</div>
				<div class="heading">
					Kontaktné údaje
				</div>
				<div class="content">
					<p id="contact_description_p">
					Pred zverejnením každého projektu je potrebné overiť autora projektu. Vyplnením údajov sa zaväzujete, že údaje uvedené v tomto formulári sú pravdivé.
					</p>					
					<div class="meno">
						<input type="text" id="name" value="Meno" name="name" onfocus="clear_input(this,'Meno')" onblur="fil_input(this,'Meno')">
					</div>
					<div class="surname">
						<input type="text" id="lastname" value="Priezvisko" name="surname" onfocus="clear_input(this,'Priezvisko')" onblur="fil_input(this,'Priezvisko')">
					</div>
					<div class="street_address">
						<input type="text" id="street_adress" value="Ulica" style="z-index:100;" name="street_address" onfocus="clear_input(this,'Ulica')" onblur="fil_input(this,'Ulica')">
					</div>
					<div class="cislo">
						<input type="text" id="street_number" value="Číslo" name="cislo" onfocus="clear_input(this,'Číslo')" onblur="fil_input(this,'Číslo')">
					</div>
					<div class="mesto">
						<input type="text" id="city" value="Mesto" name="mesto" onfocus="clear_input(this,'Mesto')" onblur="fil_input(this,'Mesto')">
					</div>
					<div class="psc">
						<input type="text" id="PSC" value="PSČ" name="psc" onfocus="clear_input(this,'PSČ')" onblur="fil_input(this,'PSČ')">
					</div>
					<div class="phone">
						<input type="text" id="phone" value="Telefón" name="phone" onfocus="clear_input(this,'Telefón')" onblur="fil_input(this,'Telefón')">
					</div>
					<div class="e-mail">
						<input type="text" id="email" value="E-mail" name="e-mail" onfocus="clear_input(this,'E-mail')" onblur="fil_input(this,'E-mail')">
					</div>
				</div>
				<div class="heading">
					Bankové spojenie
				</div>
				<div class="content">
					<p>
						Prosím uvedte údaje o Vašom bankovom účte kam majú byť vyzbierané peniaze prevedené. Krajina v ktorej je účet registrovaný sa musí zhodovať s krajinou používateľa/firmi uvedenej vyššie. Nezabudnite, že z vyzbieranej čiastky je odrátaný 4%-ný transakčný poplatok. 
					</p>
					<div class="cislo_uctu">
						<input type="text" id="IBAN" value="IBAN" name="iban" onfocus="clear_input(this,'IBAN')" onblur="fil_input(this,'IBAN')">
					</div>
					<div class="kod_banky">
						<input type="text" id="SWIFT" value="SWIFT" name="kod_banky" onfocus="clear_input(this,'SWIFT')" onblur="fil_input(this,'SWIFT')">
					</div>
					<div class="cislo_uctu">
						<input type="text" id="account_number" value="Číslo účtu" name="cislo_uctu" onfocus="clear_input(this,'Číslo účtu')" onblur="fil_input(this,'Číslo účtu')">
					</div>
					<div class="kod_banky">
						<input type="text" id="bank_number" value="Kód banky" name="kod_banky" onfocus="clear_input(this,'Kód banky')" onblur="fil_input(this,'Kód banky')">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="agree_box">
                        <input type="checkbox" name="newpr_agree_checkbox" value="correct_data" id="newpr_agree_checkbox"><label for="newpr_agree_checkbox">Potvrdzujem ze vsetky udaje su vyplnene spravne</label><div class="clear"></div>
                        <input type="checkbox" name="newpr_agree_checkbox2" value="agree_with_vop" id="newpr_agree_checkbox2"><label for="newpr_agree_checkbox2">Potvrdzujem ze som si precital podmienky pouzivania a suhlasim s nimi</label><div class="clear"></div>
			<a href="javascript:void(0)" id="newpr_submit_user" onclick="validate_save_user_details_checkbox_check()"><div class="button">Ďalej</div></a>
			<a href="javascript:void(0)" id="newpr_save_base" onclick="validate_save_user_details(false)"><div class="save_button" >Uložiť</div></a>
			<a href="?opt=new_project&page=4&new_project_id=<?php echo $_GET['new_project_id']; ?>" id="newpr_submit_awards"><div class="button">Späť</div></a>
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
<?php if($display_user_details){ ?>
	<?php if(strlen($user['name'])>1){ ?>
	<script>
		$("#name").val(<?php  echo("'".$user['name']."'");?>);
		$("#name").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['lastname'])>1){ ?>
	<script>
		$("#lastname").val(<?php  echo("'".$user['lastname']."'");?>);
		$("#lastname").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['street_adress'])>1){ ?>
	<script>
		$("#street_adress").val(<?php  echo("'".$user['street_adress']."'");?>);
		$("#street_adress").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['street_number'])>0){ ?>
	<script>
		$("#street_number").val(<?php  echo("'".$user['street_number']."'");?>);
		$("#street_number").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['city'])>1){ ?>
	<script>
		$("#city").val(<?php  echo("'".$user['city']."'");?>);
		$("#city").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['PSC'])>1){ ?>
	<script>
		$("#PSC").val(<?php  echo("'".$user['PSC']."'");?>);
		$("#PSC").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['phone'])>1){ ?>
	<script>
		$("#phone").val(<?php  echo("'".$user['phone']."'");?>);
		$("#phone").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['email'])>1){ ?>
	<script>
		$("#email").val(<?php  echo("'".$user['email']."'");?>);
		$("#email").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['IBAN'])>1){ ?>
	<script>
		$("#IBAN").val(<?php  echo("'".$user['IBAN']."'");?>);
		$("#IBAN").css("color", "#2b2b2b");
	</script>
	<?php } ?><?php if(strlen($user['SWIFT'])>1){ ?>
	<script>
		$("#SWIFT").val(<?php  echo("'".$user['SWIFT']."'");?>);
		$("#SWIFT").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['account_number'])>1){ ?>
	<script>
		$("#account_number").val(<?php  echo("'".$user['account_number']."'");?>);
		$("#account_number").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(strlen($user['bank_number'])>1){ ?>
	<script>
		$("#bank_number").val(<?php  echo("'".$user['bank_number']."'");?>);
		$("#bank_number").css("color", "#2b2b2b");
	</script>
	<?php } ?>
	<?php if(($user['type'])==0){ ?>
		<script>
			$("#fyzicka").prop("checked", true);
			disable_user_type();
		</script>
	<?php } else { ?>
		<script>
			$("#pravnicka").prop("checked", true);
			disable_user_type();
			pravnicka_osoba();
		</script>
		<?php if(strlen($user['company'])>1){ ?>
		<script>
			$("#company").val(<?php  echo("'".$user['company']."'");?>);
			$("#company").css("color", "#2b2b2b");
		</script>
		<?php } ?>
		<?php if(strlen($user['ICO'])>1){ ?>
		<script>
			$("#ICO").val(<?php  echo("'".$user['ICO']."'");?>);
			$("#ICO").css("color", "#2b2b2b");
		</script>
		<?php } ?>
		<?php if(strlen($user['DIC'])>1){ ?>
		<script>
			$("#DIC").val(<?php  echo("'".$user['DIC']."'");?>);
			$("#DIC").css("color", "#2b2b2b");
		</script>
		<?php } ?>
	<?php } ?>
<?php } ?>
<div class="clear"></div>