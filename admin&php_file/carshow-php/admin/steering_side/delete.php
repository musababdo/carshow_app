<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM steering_side WHERE id = '".$id."'");