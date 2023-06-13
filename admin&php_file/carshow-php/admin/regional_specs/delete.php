<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM regional_spec WHERE id = '".$id."'");