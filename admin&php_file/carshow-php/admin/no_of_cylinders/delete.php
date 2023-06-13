<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM no_of_cylinders WHERE id = '".$id."'");