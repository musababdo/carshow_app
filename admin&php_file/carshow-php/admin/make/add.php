<?php 

	include '../../database.php';

	$name = $_POST['name'];

	$link->query("INSERT INTO make(name)VALUES('".$name."')");