<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM mechanical_condition WHERE id = '".$id."'");