<?php 

	
include '../../database.php';

$id = $_POST['id'];

	$query = $link->query("SELECT * FROM login WHERE id = '".$id."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
