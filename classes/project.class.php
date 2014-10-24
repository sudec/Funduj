<?php 
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
class project{

	public function __construct($id,$dbh) {
	    //construct the project object and assign all properties upon construction
	    global $table_prefix;
	    $this->projectID=$id;
        $this->dbh=$dbh;
        $this->table_prefix=$table_prefix;
        
        if ($stmt =	$this->dbh->prepare("SELECT * FROM ".$this->table_prefix."_projects WHERE projectID=?")){
        	    $stmt->bindValue(1, $this->id);
    			$stmt->execute();
    			$results = $stmt->fetchAll();
    			foreach ($results as $result){
    			    $this->project_image = $result['project_image'];
    			    $this->project_title = $result['project_title'];
    			    $this->approved = $result['approved'];
    			    $this->category=$result['project_category'];
    			    $this->project_location=$result['project_location'];
                    $this->duration=$result['project_duration'];
                    $this->pledge_amount=$result['pledge_amount'];
                    $this->short_description=$result['short_description'];
                    $this->project_chalanges=$result['project_chalanges'];
                    $this->faq=$result['project_faq'];
                    $this->project_video=$result['project_video'];
                    $this->project_description=$result['project_description'];
                    $this->userID=$result['userID'];
					$this->status=$result['status'];
					$this->create_date=$result['create_date'];
					$this->user_type=$result['user_type'];
					$this->statusID=$result['statusID'];
    			}
    			
        	}
    }

	public function aprove_project(){
        if ($insert_stmt = $this->dbh->prepare("UPDATE ".$this->table_prefix."_projects SET approved=? WHERE id=?")) {    
         $insert_stmt->bindValue(1, 1);
         $insert_stmt->bindValue(2, $this->id);
         // Execute the prepared query.
         $insert_stmt->execute();
        } 
	}
	
	public function approved(){
        return $this->approved;
	}
	
	public function project_image(){
        return $this->project_image;
	}
	
	public function project_title(){
        return $this->project_title;
	}
	
	public function category(){
        return $this->category;
	}
	
	public function project_location(){
        return $this->project_location;
	}
	
	public function duration(){
        return $this->duration;
	}
	
	public function pledge_amount(){
        return $this->pledge_amount;
	}
	
	public function short_description(){
        return $this->short_description;
	}
	
	public function project_chalanges(){
        return $this->project_chalanges;
	}
	
	public function faq(){
        return $this->faq;
	}
	
	public function project_video(){
        return $this->project_video;
	}
	
	public function project_description(){
        return $this->project_description;
	}
	
	public function created_by(){
        return $this->created_by;
	}
	
		public function project_id(){
        return $this->id;
	}
}
 ?>