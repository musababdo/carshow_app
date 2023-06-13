<?php 

	
include '../../database.php';

// Get language parameter
$lang = $_GET['lang'];

	$query = $link->query("SELECT name_$lang FROM regional_spec");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
