<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$type = $_POST['type'];
	$block = $_POST['block'];

	$link->query("UPDATE login SET username = '".$username."',password = '".$password."',type = '".$type."',block = '".$block."' WHERE id = '".$id."'");


?>