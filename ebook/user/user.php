<?php

// import GetConnection
require_once __DIR__ . '../../../connection/GetConnection.php';
require_once __DIR__ . '../../../helper/cek_username.php';


// Buat object PDO
$connection = getConnection();

// ambil data json
$json = file_get_contents(__DIR__ . "../../../data/ebook.json");
// di decode dan juga menggunakna associative array
$data = json_decode($json, true);

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

// buat sql
$sql = "insert into user(name, username, email, password) values(?, ?, ?, ?)";


// looping dari banyaknya data
for ($i = 0; $i < count($data); $i++) {
    if (!is_username_already_exist($data[$i]['penjual']) ) {
    // ambil nama penjual, jadikanlah usernam yah
    $username = str_replace(' ', '', $data[$i]['penjual']);
    // ambil nama buat emial
    $email = $username . "@gmail.com";

    // siapkan preparedStatement
    $preparedStatement = $connection->prepare($sql);
    // kemudian execute
    $preparedStatement->execute([
        $data[$i]['penjual'],
        $username,
        $email,
        $username,
    ]);

    }
}

