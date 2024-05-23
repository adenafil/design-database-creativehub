<?php

require_once __DIR__ . '../../connection/GetConnection.php';

$connection = getConnection();

$sql = "
    insert into categories(name) values(?), (?), (?), (?), (?)
";

$preparedStatement = $connection->prepare($sql);
$preparedStatement->execute([
    'template',
    'icon',
    'ebook',
    'font',
    'ui kit',
]);