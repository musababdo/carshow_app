<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM body_condition WHERE id = '".$id."'");