<?php
session_start();
$con=mysqli_connect('localhost','root','');
mysqli_select_db($con,'project');

$pid=$_GET['id'];
$cid=$_POST['cid'];
$bedtype=$_POST['bed'];
$nos=$_POST['stay'];
$extra=$_POST['extra'];

$q="insert into discharge(pid,cid,bed_type,no_of_days_of_stay,extra_charges) values ('$pid','$cid','$bedtype','$nos','$extra')";
mysqli_query($con,$q);
$q1="CALL totalamount('$bedtype','$pid')";
mysqli_query($con,$q1);
header("Location:payment.php?id=$pid");
?>