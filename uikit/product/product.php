<?php

// import GetConnection
require_once __DIR__ . '../../../connection/GetConnection.php';

// Buat object PDO
$connection = getConnection();

// ambil data json
$json = file_get_contents(__DIR__ . "../../../data/uikit.json");
// di decode dan juga menggunakna associative array
$data = json_decode($json, true);

// getting user from database
$sql_for_user_icon = "select id, name from user";
$preparedStatementUser = $connection->prepare($sql_for_user_icon);
$preparedStatementUser->execute();

$name = [];

// push table user to name array
foreach ($preparedStatementUser as $user) {
    $name[] = [
        'id' => $user['id'],
        'name' => $user['name'],
    ];
}

// var_dump($name);

// create method get_id_by_name
function getIdByName(string $name_seller) {
    global $name;
    $id = null;
    foreach ($name as $data) {
        if ($data['name'] == $name_seller) {
            $id = $data['id'];
        }
    };
    return $id;
}




// buat sql
$sql = "insert into products(title, image_product_url, seller_id, description, asset_product_url, price, category_id) values(?, ?, ?, ?, ?, ?, ?)";


// looping dari banyaknya data
for ($i = 0; $i < count($data); $i++) {
    $title = $data[$i]['title'];
    $image_product = $data[$i]['src'];
    $seller_id = getIdByName($data[$i]['penjual']);
    $desc = $data[$i]['sellerText'];
    $asset_product_url = $data[$i]['linkSellerHref'];
    $price = $data[$i]['price'];
    $category = 5;

    // siapkan preparedStatement
    $preparedStatement = $connection->prepare($sql);
    // kemudian execute
    $preparedStatement->execute([
        $title,
        $image_product,
        $seller_id,
        $desc,
        $asset_product_url,
        $price,
        $category,
    ]);
}

