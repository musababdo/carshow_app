<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM horsepower WHERE id = '".$id."'");