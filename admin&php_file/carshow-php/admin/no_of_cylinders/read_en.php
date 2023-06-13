<?php 

	
include '../../database.php';

	$query = $link->query("SELECT name_en FROM no_of_cylinders");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
