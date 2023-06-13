<?php 

	
include 'database.php';

// Get language parameter
$lang = $_GET['lang'];

$make = $_POST['make'];
$model = $_POST['model'];
$trim = $_POST['trim'];
$regional = $_POST['regional'];
$price_min = $_POST['price_min'];
$price_max = $_POST['price_max'];
$year_min = $_POST['year_min'];
$year_max = $_POST['year_max'];
$kilo_min = $_POST['kilo_min'];
$kilo_max = $_POST['kilo_max'];

	$query = $link->query("SELECT id,trim,regional_specs_$lang as regional_specs,year,kilometers,price,number,
	fuel_type_$lang as fuel_type,body_condition_$lang as body_condition,mech_condition_$lang as mech_condition,
	exterior_color_$lang as exterior_color,interior_color_$lang as interior_color,doors_$lang as doors,
	no_of_cylinder_$lang as no_of_cylinder,transmission_type_$lang as transmission_type,
	body_type_$lang as body_type,horsepower_$lang as horsepower,steering_side_$lang as steering_side,
	extras_$lang as extras,image,isfavorite FROM cars WHERE make = '".$make."' AND model = '".$model."'
	AND trim = '".$trim."' AND regional_specs_$lang = '".$regional."' AND 
    kilometers BETWEEN '".$kilo_min."' AND '".$kilo_max."' AND price BETWEEN '".$price_min."' AND '".$price_max."'
    AND year BETWEEN '".$year_min."' AND '".$year_max."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
