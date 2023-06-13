<?php 

	include '../../database.php';

	$username = $_POST['username'];
	$password = $_POST['password'];
	$type = $_POST['type'];

	$link->query("INSERT INTO login(username,password,type)VALUES('".$username."','".$password."','".$type."')");