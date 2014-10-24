<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require_once($_SERVER['DOCUMENT_ROOT'].'/lib/db.php');
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();


function spravne_cislovanie($number, $jeden, $dva, $ostatne){
	if ($number==1){
		return ($jeden);
	}elseif($number==2 || $number==3 || $number==4 ){
		return ($dva);
	}else{
		return $ostatne;
	}
}

function sk_datum($date){
  $aj = array("January","February","March","April","May","June","July","August","September","October","November","December");
  $cz = array("ledna","února","března","dubna","května","června","července","srpna","září","října","listopadu","prosince");
  $sk = array("Január","Február","Marec","Apríl","Máj","Jún","Júl","August","September","Október","November","December");
  $datum = str_replace($aj, $sk, date("F Y", $date));
  return $datum;
}
function datum(){
  $aj = array("January","February","March","April","May","June","July","August","September","October","November","December");
  $cz = array("ledna","února","března","dubna","května","června","července","srpna","září","října","listopadu","prosince");
  $sk = array("Január","Február","Marec","Apríl","Máj","Jún","Júl","August","September","Október","November","December");
  $datum = str_replace($aj, $sk, date("j.F Y"));
  return $datum;
} 



/*****************************************    Comments *****************************/


?>