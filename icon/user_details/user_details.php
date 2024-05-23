<?php

// import GetConnection
require_once __DIR__ . '../../../connection/GetConnection.php';
require_once __DIR__ . '../../../helper/cek_username.php';


// Buat object PDO
$connection = getConnection();

// ambil data json
$json = file_get_contents(__DIR__ . "../../../data/icon.json");
// di decode dan juga menggunakna associative array
$data = json_decode($json, true);

// getting table user from database
$sql_for_user_icon = "select id, name from user";
$preparedStatementUser = $connection->prepare($sql_for_user_icon);
$preparedStatementUser->execute();

$name = [];

// var_dump($preparedStatementUser);

// var_dump($name);
// push data table user to name with field id and name
foreach ($preparedStatementUser as $user) {
    $name[] = [
        'id' => $user['id'],
        'name' => $user['name'],
    ];
}

// method untuk ambil data unique
function getDistinctData($data) {
    // data unique
    $unique = [];
    // data yang sudah dilihat
    $seen = [];

    // looping parameter data
    foreach ($data as $item) {

        // ambil key dari item ('output keluarnya nama penjual')
        $key = $item['penjual'];

        // jika nama penjual belum dilihat
        if (!in_array($key, $seen)) {
            // maka masukan ini sebagai data unique
            $unique[] = $item;
            // dan karena udah dilihat dimasukan juga namanya
            $seen[] = $key;
        }
    }

    // return data unique
    return $unique;
}

// filter data
$data = getDistinctData($data);


// method to get id by his name 
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
$sql = "insert into user_details(user_id, bio, title, location) values(?, ?, ?, ?)";


// looping dari banyaknya data
for ($i = 0; $i < count($data); $i++) {
    if (!is_id_exist_in_user_details(getIdByName($data[$i]['penjual']))) {

        $user_id = getIdByName($data[$i]['penjual']);
        $bio = "Hello i'm " . $data[$i]['penjual'] . " and i'm an ui ux enginner.";
        $title = 'ui ux';
        $loaction = $data[$i]['ppSeller'];
    
        // siapkan preparedStatement
        $preparedStatement = $connection->prepare($sql);
        // kemudian execute
        $preparedStatement->execute([
            $user_id,
            $bio,
            $title,
            $loaction,
        ]);    
    }}

