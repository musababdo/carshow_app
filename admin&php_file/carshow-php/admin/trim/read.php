<?php 

	
include '../../database.php';

	$query = $link->query("SELECT * FROM trim");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
