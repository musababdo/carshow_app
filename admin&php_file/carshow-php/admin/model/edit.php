<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$name = $_POST['name'];
	$make_id = $_POST['make_id'];

	$link->query("UPDATE model SET name = '".$name."',make_id = '".$make_id."' WHERE id = '".$id."'");


?>