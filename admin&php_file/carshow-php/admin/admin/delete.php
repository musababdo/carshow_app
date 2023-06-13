<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM login WHERE id = '".$id."'");