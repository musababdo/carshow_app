<?php 

	
include '../../database.php';

$make = $_POST['make'];

	$query = $link->query("SELECT * FROM model WHERE make_id = '".$make."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);