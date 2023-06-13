<?php 

	include '../../database.php';

	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];

	$link->query("UPDATE login SET username = '".$username."',password = '".$password."' WHERE id = '".$id."'");


?>