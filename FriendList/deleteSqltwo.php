<?php

$username = "root";

$database = "testdb";

mysql_connect("localhost", $username);

@mysql_select_db($database) or die("Unable to find database");

$name = @$_GET['name'];



$querytwo = "DELETE FROM Person WHERE firstName = '$name'";


mysql_query($querytwo) or die (mysql_error("error"));

mysql_close();

?>



