<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$name = $_POST['name'];
	$make_id = $_POST['make_id'];
	$model_id = $_POST['model_id'];

	$link->query("UPDATE trim SET name = '".$name."',make_id = '".$make_id."',model_id = '".$model_id."' WHERE id = '".$id."'");


?>