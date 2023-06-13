<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM doors WHERE id = '".$id."'");