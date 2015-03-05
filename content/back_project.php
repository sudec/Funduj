<?php
	require_once($_SERVER['DOCUMENT_ROOT'].'/modules/encrypt.php');
	require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
	require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
	sec_session_start();
	$amount=decrypt($_GET['amm']);
	$title=decrypt($_GET['ttl']);
	$id=decrypt($_GET['aaid']);
	$award_id=decrypt($_GET['wrdid']);

	if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_awards WHERE projectID=? ORDER BY amount ASC")){
        	    $stmt->bindValue(1, $id);
    			$stmt->execute();
    			$results_awards = $stmt->fetchAll();
	}
        
        if ($stmt =	$dbh->prepare("SELECT userID FROM ".$table_prefix."_projects WHERE projectID=? ")){
        	    $stmt->bindValue(1, $id);
    			$stmt->execute();
    			$project_by = $stmt->fetch();
	}
?>
<!-- <div class="message_holder" id="error_message_holder"> 
</div>-->
<div id="payments">
<?php    
    /**************    PREVENT THE USER TO BACK HIS/HER OWN PROJECT *****************/
    if ($_SESSION['user_id']==$project_by['userID']){
        ?>
    <script>
        display_error_message("Nie je mozne prispiet na vlastny projekt",1);
    </script>    
        <?php
    }else{/* Ending part of the else is the last closing bracket
    /**********************************************************************************/
?>
	<h1>
		1. Prosím zadajte čiastku akou si želáte prispieť
	</h1>
	<span class="currencyinput">€<input type="text" id="fund_amount" class="fund_amount" name="fund_amount" <?php if ($amount>0) {echo "value='".$amount."'";} else {echo "value=1.00";} ?>></span><label for="fund_amount" id="amount_label">Je na Vás koľko prispejete.<br /> Minimálna čiastka pre vybranú odmenu je <span id="minimal_pledge_value">1</span> €.</label>
	<h1>
		2. Prosím vyberte si odmenu
	</h1>
			<div class="right_fix">
				<div class="help">
					<div class="text">
						<h1 class="right_fix_h1">
							Potrebujete poradiť?
						</h1>
						Pozrite si časť <a href="#">Typy pri vytváraní projektov</a> . Nájdete tam užitočné informácie ktoré Vám môžu byť nápomocné pri vytváraní Vášho nového projektu.
					</div>
				</div>
			</div>
	<div id="payment_rewards">
		<a class='back_project_payment' href='javascript:void(0)' id="no_award">
			<div class='reward_payment' id="no_award">
				<div class='award_left'>
					<input type='radio' name='award_select' <?php echo ("value='{\"award_id\":\"no_award\",\"award_min_val\":\"1\",\"award_description\":\"no_award\", \"award_title\":\"Bez odmeny\",\"user_id\":\"".$_SESSION['user_id']."\", \"project_id\":\"".$id."\"}'"); ?> id='award_no_award'>
					<label for='no_award'>Bez odmeny!</label>
				</div>
				<div class='award_right'>
					<div class='payment_content'>
					 Neželám si dostať odmenu, len by som rád podporil tento projekt.
					</div>
				</div>
			</div>
		</a>
		<hr>
		<?php
				$i=0;
				foreach ($results_awards as $award){
					$is_available = true;
					$color="green";
					$delivery = sk_datum(strtotime($award['delivery_date']));
					if (($award['available']>$award['backers'] || $award['available']==0)) {
						echo ("<a class='back_project_payment' id='".$award['entryID']."' href='javascript:void(0)'>");
						echo("
						<div class='reward_payment' id='".$award['entryID']."'>
							<div class='award_left'>
								<input type='radio' name='award_select' value='{\"award_id\":\"".$award['entryID']."\",\"award_min_val\":\"".$award['amount']."\",\"award_description\":\"".$award['description']."\", \"award_title\":\"".$award['title']."\",\"user_id\":\"".$_SESSION['user_id']."\", \"project_id\":\"".$id."\"}' id='award_".$award['entryID']."'>
								<label for='".$award['entryID']."'>".$award['amount']." € a viac</label>
							</div>
							<div class='award_right'>
								<div class='payment_content'>
									 ".$award['description']."
									<p class='".$color."'>".$available."</p>
									<p>Dátum dodania: ".$delivery."</p>
								</div>
							</div>
						</div>");
						echo "</a><hr>";
					}
				}
				?>
	</div>
	<h1>
		3. Anonymny prispevok
	</h1>
	<div id="public_backing">
		<input type="checkbox" id="public_backing_chckbx" name="public_backing_chckbx"> <label for="public_backing_chckbx">Nezobrazovat moje meno v zozname prispievatelov tohto projektu</label>

	</div>
	<h1>
		4. Prosím vyberte si spôsob platby
	</h1>
	<div id="wire" class="payment_type" title="Po vybraní tejto možnosti Vám bude vygenerovaný platobný príkaz na základe ktorého môžete uhradiť svoj príspevok.">
			Prevodom na účet
		<div class="button">
			Prispieť
		</div>
	</div>
	<div id="gopay" class="payment_type">
		<img src="../img/gopay.png" alt="GoPay" title="Po vybraní tejto možnosti budete presmerovaný na stránku gopay.com kde môžete dokončiť svoju platbu.">
		<div class="button">
			Prispieť
		</div>
	</div>
	<div id="paypal" class="payment_type" title="Po vybraní tejto možnosti budete presmerovaný na stránku paypal.com kde môžete dokončiť svoju platbu.">
			<img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" alt="PayPal">
			<!--<script src="script/paypal-button.min.js?merchant=info-facilitator@webvibes.sk"
				data-button="buynow"
				data-name="<?php //echo $title?>"
				data-amount="<?php //echo $amount?>"
				data-locale="sk_SK"
				data-currency="EUR"
				data-env="sandbox"
				data-custom="project_id=<?php //echo $id?>&user_id=<?php// echo $_SESSION['user_id']?>&award_id=<?php //echo $award_id?>"
				data-callback="http://test.sudec.net/content/paypal_IPN.php"
				async
			></script>-->
			<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" id="paypal_form">
				<input type="hidden" name="cmd" value="_xclick">
				<input type="hidden" name="business" value="info-facilitator@webvibes.sk">
				<input type="hidden" name="item_name" value="<?php echo $title?>">
				<input type="hidden" name="item_number" value="<?php echo $award_id?>">
				<input type="hidden" name="amount" value="<?php echo $amount?>">
				<input type="hidden" name="currency_code" value="EUR">
				<input type="hidden" name="custom" value="project_id=<?php echo $id?>&user_id=<?php echo $_SESSION['user_id']?>&award_id=<?php echo $award_id?>">
				<input type="image" src="img/prispiet.PNG" class="paypal_button" name="submit" alt="PayPal">
			</form>
			
	</div>
</div>
<?php
if ($award_id>0 || $award_id==="no_award"){
?>
<script>
	$("#award_"+ <?php echo $award_id?>).prop("checked", true);
	$(".active").toggleClass( "active" );
	$("#"+<?php echo $award_id?>+".reward_payment").toggleClass( "active" );
</script>
<?php } 
    }
?>