<?php

$user_data = file_get_contents(__DIR__ . "../../../data/MOCK_DATA.json");
$decode_data = json_decode($user_data, true);


$number_data = file_get_contents(__DIR__ . "../../../data/number.json");
$decode_number = json_decode($number_data, true);




