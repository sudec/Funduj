<?php 

class database{

	private static $connection;

     public function __construct($db_server, $db_user, $db_pass, $db_select) {
            $this->db_server=$db_server;
            $this->db_user=$db_user;
            $this->db_pass=$db_pass;
            $this->db_select=$db_select;
            $this->database();

    }

	function database(){
		try {
            $dbh = new PDO('mysql:unix_socket=/tmp/mysql51.sock;dbname='.$this->db_select,  $this->db_user, $this->db_pass);
            $this->dbh = $dbh;
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
           
	}

   function prepare($statement){
        $this->statement = $this->dbh->prepare($statement);
      return $this->statement;
    }

    function query($statement){
        $this->statement = $this->dbh->query($statement);
      return $this->statement;
    }

    function close(){
        $this->dbh=null;
        return null;
    }
	
	function lastInsertId(){
		return $this->dbh->lastInsertId();
	}
}

 ?>