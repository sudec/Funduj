<?php 
include $_SERVER['DOCUMENT_ROOT'].'/config.php';

class category{

	public function __construct() {
	    
    }

	public function get_category($dbh, $id){
		global $table_prefix;
		if ($stmt =	$dbh->prepare("SELECT * FROM ".$table_prefix."_categories")){
			$stmt->execute();
			$results = $stmt->fetchAll();
			foreach ($results as $result){
                if ($id==$result['ID']){
			        $cat_level=$result['level'];
			        if ($cat_level>1){
			            $this->sub_cat=$result['name'];
			            $this->parrent_id=$result['parent_ID'];
			            foreach ($results as $result2){
			                if ($this->parrent_id==$result2['ID']){
			                    $this->main_cat=$result2['name'];
			                    $main_category=$this->main_cat;
			                    $sub_category=$this->sub_cat;
			                    $category=$main_category."->".$sub_category;
			                    return $category;
			                }
			            }
			        }else{
			           $category=$result['name'];
			           return $category;
			        }
			    }
			}
			if (!isset($category)){
			    $category="Unknown";
			    return $category;
			}
		}
	}
}
 ?>