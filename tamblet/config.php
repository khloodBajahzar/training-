<?php
namespace config;
use PDO;
use PDOException;

class config {
	
	public function connect {
		$servername = "127.0.0.1";
		$username = "root";
		$password = "";

	try {
		$conn = new PDO("mysql:host=$servername;dbname=training", $username, $password);
		// set the PDO error mode to exception
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		echo "Connected successfully"; 
		//$stmt = $conn->prepare("SELECT * FROM student"); 
		// $stmt->execute();
		//var_dump($stmt->fetchAll());
		// set the resulting array to associative
		// $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
		//foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
		//  echo $v;
		//}
    }
	catch(PDOException $e)
    {
		echo "Connection failed: " . $e->getMessage();
    }
		return $conn;
	}
	
	
	public function baiscinfosupervisor (){
		
		$conn = $this->connect();
			$stmt = $conn->prepare('select * from student');
			$stmt->execute();
			var_dump($stmt->fetchAll());
			
	}
}
?>