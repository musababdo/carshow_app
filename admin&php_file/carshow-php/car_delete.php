<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM cars WHERE id = '".$id."'");