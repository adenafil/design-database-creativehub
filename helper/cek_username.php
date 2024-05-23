<?php

require_once __DIR__ . '../../connection/getConnection.php';


function is_username_already_exist(string $username) {
    $connection = getConnection();
    $sql = "select id, name from user";
    $preparedStatementUser = $connection->prepare($sql);
    $preparedStatementUser->execute();    

    foreach ($preparedStatementUser as $key => $value) {
        if ($value['name'] == $username) return true;
    };
    return false;
};

function is_id_exist_in_user_details(int $id) {
    $connection = getConnection();
    $sql = "select user_id from user_details";
    $preparedStatementUser = $connection->prepare($sql);
    $preparedStatementUser->execute();    

    foreach ($preparedStatementUser as $key => $value) {
        if ($value['user_id'] == $id) return true;
    };
    return false;
};

// var_dump(is_username_already_exist('Hugeicons Pro'));