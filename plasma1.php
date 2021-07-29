<?php
session_start();
$con=mysqli_connect('localhost','root','');
mysqli_select_db($con,'project');

$fname=$_POST['pname'];
$gender=$_POST['Gender'];
$bgrp=$_POST['bloodgroup'];
$add=$_POST['add'];
$cnum=$_POST['mno'];


	$query1="insert into plasma_donation (pname,gender,blood_group,mobileno,address) values('$fname','$gender','$bgrp','$cnum','$add')";
	mysqli_query($con,$query1);
	header('location:plasma.php');
?>