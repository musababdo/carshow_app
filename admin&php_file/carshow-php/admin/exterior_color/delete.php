<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM exterior_color WHERE id = '".$id."'");