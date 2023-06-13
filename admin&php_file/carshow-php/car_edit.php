<?php
$id = $_POST['id'];$a_id  = $_POST['a_id'];
$make = $_POST['make'];$model = $_POST['model'];$trim = $_POST['trim'];
$regional_specs_ar = $_POST['regional_specs_ar'];$regional_specs_en = $_POST['regional_specs_en'];
$year = $_POST['year'];$kilometers = $_POST['kilometers'];$price = $_POST['price'];$number = $_POST['number'];
$fuel_type_ar = $_POST['fuel_type_ar'];$fuel_type_en = $_POST['fuel_type_en'];
$body_condition_ar = $_POST['body_condition_ar'];$body_condition_en = $_POST['body_condition_en'];
$mech_condition_ar = $_POST['mech_condition_ar'];$mech_condition_en = $_POST['mech_condition_en'];
$exterior_color_ar = $_POST['exterior_color_ar'];$exterior_color_en = $_POST['exterior_color_en'];
$interior_color_ar = $_POST['interior_color_ar'];$interior_color_en = $_POST['interior_color_en'];
$doors_ar = $_POST['doors_ar'];$doors_en = $_POST['doors_en'];
$no_of_cylinder_ar = $_POST['no_of_cylinder_ar'];$no_of_cylinder_en = $_POST['no_of_cylinder_en'];
$transmission_type_ar = $_POST['transmission_type_ar'];$transmission_type_en = $_POST['transmission_type_en'];
$body_type_ar = $_POST['body_type_ar'];$body_type_en = $_POST['body_type_en'];
$horsepower_ar = $_POST['horsepower_ar'];$horsepower_en = $_POST['horsepower_en'];
$steering_side_ar = $_POST['steering_side_ar'];$steering_side_en = $_POST['steering_side_en'];
$extras_ar = $_POST['extras_ar'];$extras_en = $_POST['extras_en'];
$date  = $_POST['date'];
$imagesJson = $_POST['images'];
$images = json_decode($imagesJson);

  // Connect to database
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "carshow";
  $conn = new mysqli($servername, $username, $password, $dbname);

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  $myimg = array();
  foreach ($images as $image) {
	$decode = base64_decode($image);
	$path = "images/".uniqid().'.jpeg';
	$finalpath = "http://10.0.2.2/carshow/".$path;
	file_put_contents($path,$decode);
    $myimg[] = $finalpath; 
  }
  $json=json_encode($myimg);
  $sql = "UPDATE cars SET a_id = '$a_id',make = '$make',model = '$model',trim = '$trim',regional_specs_ar = '$regional_specs_ar',regional_specs_en = '$regional_specs_en',year = '$year',kilometers = '$kilometers',price = '$price',number = '$number',fuel_type_ar = '$fuel_type_ar',fuel_type_en = '$fuel_type_en',body_condition_ar = '$body_condition_ar',body_condition_en = '$body_condition_en',mech_condition_ar = '$mech_condition_ar',mech_condition_en = '$mech_condition_en',exterior_color_ar = '$exterior_color_ar',exterior_color_en = '$exterior_color_en',interior_color_ar = '$interior_color_ar',interior_color_en = '$interior_color_en',doors_ar = '$doors_ar',doors_en = '$doors_en',no_of_cylinder_ar = '$no_of_cylinder_ar',no_of_cylinder_en = '$no_of_cylinder_en',transmission_type_ar = '$transmission_type_ar',transmission_type_en = '$transmission_type_en',body_type_ar = '$body_type_ar',body_type_en = '$body_type_en',horsepower_ar = '$horsepower_ar',horsepower_en = '$horsepower_en',horsepower_en = '$horsepower_en',steering_side_ar = '$steering_side_ar',steering_side_en = '$steering_side_en',extras_ar = '$extras_ar',extras_en = '$extras_en',image = '$json',date = '$date' WHERE id = '$id'";

    if ($conn->query($sql) !== TRUE) {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }

  $conn->close();
?>