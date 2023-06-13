<?php 

	include '../../database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM transmission_type WHERE id = '".$id."'");