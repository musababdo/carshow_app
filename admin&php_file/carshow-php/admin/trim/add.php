<?php 

	include '../../database.php';

	$name = $_POST['name'];
	$make_id = $_POST['make_id'];
	$model_id = $_POST['model_id'];

	$link->query("INSERT INTO trim (name,make_id,model_id)VALUES('".$name."','".$make_id."','".$model_id."')");