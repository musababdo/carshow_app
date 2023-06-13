<?php 

	
include 'database.php';

$a_id = $_POST['a_id'];

	$query = $link->query("SELECT * FROM cars WHERE a_id = '".$a_id."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
