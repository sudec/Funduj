<?php
//PHP SCRIPT: getimages.php
Header("content-type: application/x-javascript");

//This function gets the file names of all images in the current directory
//and ouputs them as a JavaScript array
function returnimages() {
	$dirname="../../files/".$_GET['id']."/img";
	$pattern="(\.jpg$)|(\.png$)|(\.jpeg$)|(\.gif$)"; //valid image extensions
	$files = array();
	$curimage=0;
	if($handle = opendir($dirname)) {
		while(false !== ($file = readdir($handle))){
		if(eregi($pattern, $file)){ //if this file is a valid image
			//Output it as a JavaScript array element
			echo 'galleryarray[1]['.$curimage.']="files/'.$_GET['id'].'/img/large_thumb/large_thumb_'.$file .'";';
			echo 'galleryarray[2]['.$curimage.']="files/'.$_GET['id'].'/img/thumb/thumb_'.$file .'";';
			$curimage++;
		}
		}
		
		closedir($handle);
	}
	return($files);
}

echo 'var galleryarray=new Array();galleryarray[1]=new Array();galleryarray[2]=new Array();'; //Define array in JavaScript
returnimages() //Output the array elements containing the image file names
?> 