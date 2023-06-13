<?php 

	include 'database.php';

	$id = $_POST['id'];
	$isfavorite = $_POST['isfavorite'];

	$link->query("UPDATE cars SET isfavorite = '".$isfavorite."' WHERE id = '".$id."'");


?>