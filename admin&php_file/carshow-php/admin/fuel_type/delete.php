<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM fuel_type WHERE id = '".$id."'");