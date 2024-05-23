<?php

require_once __DIR__ . '../../connection/getConnection.php';

$connection = getConnection();

$sql = "select id, name from user";
$preparedStatementUser = $connection->prepare($sql);
$preparedStatementUser->execute();

function is_username_already_exist(string $username) {
    global $preparedStatementUser;
    foreach ($preparedStatementUser as $key => $value) {
        if ($value['name'] == $username) return true;
    };
    return false;
};

// var_dump(is_username_already_exist('Hugeicons Pro'));