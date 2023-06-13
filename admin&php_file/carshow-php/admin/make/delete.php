<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM make WHERE id = '".$id."'");