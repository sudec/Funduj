<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
	$dirname="../../files/".$_SESSION['curent_new_project_ID']."/img";
	$pattern="(\.jpg$)|(\.png$)|(\.jpeg$)|(\.gif$)"; //valid image extensions
	$files = array();
	$curimage=0;
	$arr = array();
	if($handle = opendir($dirname)) {
		while(false !== ($file = readdir($handle))){
		if(eregi($pattern, $file)){ //if this file is a valid image
			     $arr[] = array( 
					"image" => "/files/".$_SESSION['curent_new_project_ID']."/img/".$file,
					"thumb" => "/files/".$_SESSION['curent_new_project_ID']."/img/thumb/thumb_".$file
				);
		}
		}
		closedir($handle);
	}
echo json_encode($arr);
?>

