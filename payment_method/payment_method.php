<?php

require_once __DIR__ . '../../connection/GetConnection.php';

$sql = "
    insert into payment_method(name)
    values(?), (?), (?), (?), (?), (?)
";

$connection = getConnection();
$preparedStatement = $connection->prepare($sql);
$preparedStatement->execute([
    'dana', 'bri', 'bni', 'bca', 'shopeepay', 'gopay'
]);