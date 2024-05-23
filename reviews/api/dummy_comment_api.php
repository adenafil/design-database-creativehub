<?php

// // URL API
// $url = "https://dummyjson.com/comments/";

// // mengambil response
// $response = file_get_contents($url);

// // cek response success or not
// if ($response !== false) {
//     // decode jsonm in array associatif
//     $data = json_decode($response, true);

//     print_r($data);
// } else {
//     echo "gagal";
// }

function get_comments() {
    $url = "https://jsonplaceholder.typicode.com/comments";

    // mengambil response
    $response = file_get_contents($url);

    if ($response !== false) {
        // decode jsonm in array associatif
        $data = json_decode($response, true);
    
        // var_dump($data);
        return $data;
    } else {
        return null;
    }    
}

// $data = get_comments();

// var_dump($data[0]['body']);

// for ($i = 1; $i <= count($data); $i++) {
//     $data[$i];
// }