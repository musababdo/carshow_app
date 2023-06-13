<?php 

	
include '../../database.php';

$make = $_POST['make'];
$model = $_POST['model'];

	$query = $link->query("SELECT * FROM trim WHERE make_id = '".$make."' AND model_id = '".$model."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
