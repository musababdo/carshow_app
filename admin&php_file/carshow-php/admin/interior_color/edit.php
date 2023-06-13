<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$name_ar = $_POST['name_ar'];
	$name_en = $_POST['name_en'];

	$link->query("UPDATE interior_color SET name_ar = '".$name_ar."',name_en = '".$name_en."' WHERE id = '".$id."'");


?>