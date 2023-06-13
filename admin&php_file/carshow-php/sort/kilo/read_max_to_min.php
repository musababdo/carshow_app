<?php 

	
include '../../database.php';

// Get language parameter
$lang = $_GET['lang'];

$make = $_POST['make'];
$model = $_POST['model'];

	$query = $link->query("select id,trim,regional_specs_$lang as regional_specs,year,kilometers,price,number,
	fuel_type_$lang as fuel_type,body_condition_$lang as body_condition,mech_condition_$lang as mech_condition,
	exterior_color_$lang as exterior_color,interior_color_$lang as interior_color,doors_$lang as doors,
	no_of_cylinder_$lang as no_of_cylinder,transmission_type_$lang as transmission_type,
	body_type_$lang as body_type,horsepower_$lang as horsepower,steering_side_$lang as steering_side,
	extras_$lang as extras,image,isfavorite from cars where make = '$make' AND model = '$model' order by length(kilometers) DESC,kilometers DESC");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
