<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM interior_color WHERE id = '".$id."'");