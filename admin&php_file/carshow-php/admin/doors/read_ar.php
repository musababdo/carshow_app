<?php 

	
include '../../database.php';

	$query = $link->query("SELECT name_ar FROM doors");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
