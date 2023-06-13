<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$name = $_POST['name'];

	$link->query("UPDATE make SET name = '".$name."' WHERE id = '".$id."'");


?>