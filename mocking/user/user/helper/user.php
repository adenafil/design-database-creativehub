<?php


require_once __DIR__ . "../../../../../connection/GetConnection.php";


function getMockingUserById($int ) {
    $connection = getConnection();

    $sql = "
    select id, name, username from user where id = ?
    ";

    $preparedStatement = $connection->prepare($sql);
    $preparedStatement->execute([
        $int,
    ]);

    foreach ($preparedStatement as $key => $value) {
        return $value['name'];
    }
    
    return $preparedStatement;
}
