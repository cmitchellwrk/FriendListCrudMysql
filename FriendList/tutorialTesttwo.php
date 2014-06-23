<?php

$username = "root";

$database = "testdb";

mysql_connect("localhost", $username);

@mysql_select_db($database) or die("Unable to find database");


$firstname = @$_GET['firstname'];

$lastname = @$_GET['lastname'];

$organization = @$_GET['organization'];

$phonenumber = @$_GET['phonenumber'];

$query = "INSERT INTO Person VALUES ( '' , '$firstname', '$lastname', '$organization', '$phonenumber')";

mysql_query($query) or die (mysql_error("error"));

mysql_close();

?>



