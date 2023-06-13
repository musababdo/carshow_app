<?php 

	include '../../database.php';

	$name_ar = $_POST['name_ar'];
	$name_en = $_POST['name_en'];

	$link->query("INSERT INTO no_of_cylinders(name_ar,name_en)VALUES('".$name_ar."','".$name_en."')");