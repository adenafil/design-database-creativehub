<?php

require_once __DIR__ . '../../../../connection/GetConnection.php';
require_once __DIR__ . '../../user_mocking.php';
require_once __DIR__ . '/helper/user.php';
require_once __DIR__ . '../../../../reviews/api/dummy_comment_api.php';

$connection = getConnection();

$sql = "
    insert into user(name, username, email, password)
    values(?, ?, ?, ?)
";

// var_dump($decode_data[0]['username']);

foreach ($decode_data as $key => $value) {
    // var_dump($value['username']);
    $preparedStatement = $connection->prepare($sql);
    $preparedStatement->execute([
        $value['username'],
        $value['username'],
        $value['username'] . "@gmail.com",
        $value['username'] . "123"
    ]);
}

$sql_user_details = "
    insert into user_details(user_id, bio, title, location)
    values(?, ?, ?, ?)
";

$id = 268;
for ($i = 0; $i <= 49; $i++) {
    $user_id = $id + $i;
    $bio = "hi, i'm " . $decode_data[$i]['username'] ;
    $title = 'enemployed';
    $location = null;

    $preparedStatement = $connection->prepare($sql_user_details);
    $preparedStatement->execute([
        $user_id,
        $bio,
        $title,
        $location,
    ]);
}

$sql_for_carts_table = "
    insert into carts(user_id)
    values(?)
";

for ($i = 0; $i <= 49; $i++) {
    $user_id = $id + $i;
    $preparedStatement = $connection->prepare($sql_for_carts_table);
    $preparedStatement->execute([
        $user_id,
    ]);
}

// carts_product

$sql_cart_products = "
    insert into cart_products(cart_id, product_id)
    values(?, ?)
";

$temp_product_id = 1;
for ($i = 1; $i <= 49; $i++) {
    for ($j = 0; $j < 10; $j++) {
        // var_dump($temp_product_id);
        $preparedStatement = $connection->prepare($sql_cart_products);
        $preparedStatement->execute([
            $i,
            $temp_product_id,
        ]);
        ++$temp_product_id;
    }
}

// transaction
$sql_transaction = "
    insert into transactions(product_id, user_id)
    values(?, ?)
";

$temp_product_id = 1;
for ($i = 268; $i <= 317; $i++) {
    for ($j = 0; $j < 10; $j++) {
        // var_dump($temp_product_id);
        $preparedStatement = $connection->prepare($sql_transaction);
        $preparedStatement->execute([
            $temp_product_id,
            $i,
        ]);
        ++$temp_product_id;
    }
}

$status = [
    'PENDING',
    'Completed',
    'Failed',
    'Canceled',
    'In Progress',
    'Declined',
    'On Hold',
    'Expired',
];

// payment
$sql_transaction = "
    insert into payment(payment_method_id, name, number, payment_proof_img, transaction_id, status)
    values(?, ?, ?, ?, ?, ?)
";



$temp_product_id = 1;
for ($i = 268; $i <= 317; $i++) {
    for ($j = 0; $j < 10; $j++) {
        // var_dump($temp_product_id);
        $preparedStatement = $connection->prepare($sql_transaction);
        $preparedStatement->execute([
            rand(1, 6),
            getMockingUserById($i),
            $decode_number[$temp_product_id -1]['number'],
            'www.google.com/' . $decode_number[$temp_product_id - 1]['number'],
            $temp_product_id,
            $status[rand(0, 7)],
        ]);
        ++$temp_product_id;
    }
}

// reviews
$sql_transaction = "
    insert into reviews(star, comment, user_id, product_id)
    values(?, ?, ?, ?)
";

$data_comment = get_comments();
$temp_product_id = 1;
for ($i = 268; $i <= 317; $i++) {
    for ($j = 0; $j < 10; $j++) {
        // var_dump($temp_product_id);
        $preparedStatement = $connection->prepare($sql_transaction);
        $preparedStatement->execute([
            rand(3, 5),
            $data_comment[$temp_product_id - 1]['body'],
            $i,
            $temp_product_id,
        ]);
        ++$temp_product_id;
    }
}
