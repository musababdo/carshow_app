<?php 

	include '../../database.php';

	$name_ar = $_POST['name_ar'];
	$name_en = $_POST['name_en'];

	$link->query("INSERT INTO horsepower(name_ar,name_en)VALUES('".$name_ar."','".$name_en."')");