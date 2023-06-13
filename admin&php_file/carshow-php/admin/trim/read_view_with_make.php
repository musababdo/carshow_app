<?php 

	
include '../../database.php';

$make = $_POST['make'];
$model = $_POST['model'];

	$query = $link->query("SELECT * FROM vtrim WHERE makename = '".$make."' AND modelname = '".$model."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
