<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM model WHERE id = '".$id."'");