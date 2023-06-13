<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM body_type WHERE id = '".$id."'");