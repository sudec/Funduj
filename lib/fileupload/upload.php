<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/lib/session.php';
sec_session_start();
if (isset($_SESSION['curent_new_project_ID']))
{
	$output_dir = $_SERVER['DOCUMENT_ROOT']."/files/".$_SESSION['curent_new_project_ID']."/img/";
}else{
	$output_dir = $_SERVER['DOCUMENT_ROOT']."/users/".$_SESSION['user_id']."/img/";
}
if(isset($_FILES["myfile"]))
{
	$ret = array();

	$error =$_FILES["myfile"]["error"];
	//You need to handle  both cases
	//If Any browser does not support serializing of multiple files using FormData() 
	if(!is_array($_FILES["myfile"]["name"])) //single file
	{
 	 	$fileName = $_FILES["myfile"]["name"];
 		move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir.$fileName);
    	$ret[]= $fileName;
		// Get new sizes
		$thumb = new Imagick();
		$thumb->readImage($output_dir.$fileName);    
		$thumb->resizeImage(225,0,Imagick::FILTER_LANCZOS,1);
		$thumb->writeImage($output_dir.'/thumb/thumb_'.$fileName);
		$thumb->clear();
		$thumb->destroy();
		
		$large_thumb = new Imagick();
		$large_thumb->readImage($output_dir.$fileName);    
		$large_thumb->resizeImage(533,0,Imagick::FILTER_LANCZOS,1);
		$large_thumb->writeImage($output_dir.'/large_thumb/large_thumb_'.$fileName);
		$large_thumb->clear();
		$large_thumb->destroy();
	}
	else  //Multiple files, file[]
	{
	  $fileCount = count($_FILES["myfile"]["name"]);
	  for($i=0; $i < $fileCount; $i++)
	  {
	  	$fileName = $_FILES["myfile"]["name"][$i];
		move_uploaded_file($_FILES["myfile"]["tmp_name"][$i],$output_dir.$fileName);
	  	$ret[]= $fileName;
	  }
	
	}
    echo json_encode($ret);
 }
 ?>