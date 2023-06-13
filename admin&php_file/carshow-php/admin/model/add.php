<?php 

	include '../../database.php';

	$name = $_POST['name'];
	$make_id = $_POST['make_id'];

	$link->query("INSERT INTO model(name,make_id)VALUES('".$name."','".$make_id."')");