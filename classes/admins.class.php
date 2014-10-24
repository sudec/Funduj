<?php 
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
class admin{

	public function __construct($admin_name) {
		$this->admin=$admin_name;
    }

	function last_login($admin,$dbh){
		global $table_prefix;
		if ($stmt =	$dbh->prepare("SELECT last_login FROM ".$table_prefix."_admins WHERE username = :admin LIMIT 1")){
			$stmt->bindParam(':admin',$this->admin, PDO::PARAM_STR);
			$stmt->execute();
			$result = $stmt->fetch();
			echo $result['last_login'];
		}
	}

	function update_last_login($dbh){
		global $table_prefix;
		if ($stmt =	$dbh->prepare("UPDATE ".$table_prefix."_admins SET last_login=now() WHERE username = :admin LIMIT 1")){
			$stmt->bindParam(':admin',$this->admin, PDO::PARAM_STR);
			$stmt->execute();
		}
	}
}


 ?>