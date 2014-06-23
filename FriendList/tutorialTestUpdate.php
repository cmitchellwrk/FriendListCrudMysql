<?php

$username = "root";

$database = "testdb";

mysql_connect("localhost", $username);

@mysql_select_db($database) or die("Unable to find database");


$firstname = @$_GET['firstname'];

$lastname = @$_GET['lastname'];

$organization = @$_GET['organization'];

$phonenumber = @$_GET['phonenumber'];

$id = @$_GET['id'];

$query = "UPDATE `Person` SET  `firstname`='$firstname',`Lastname`='$lastname',
`Organization`='$organization',`Phonenumber`='$phonenumber' WHERE `id`='$id'";


mysql_query($query) or die (mysql_error("error"));

mysql_close();

?>




