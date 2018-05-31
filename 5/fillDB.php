<?php


$host = '127.0.0.1';
$db = 'testDB';
$user = 'root';
$pass = '321';
$charset = 'utf8';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$dbh = new PDO($dsn, $user, $pass);
$table_1 = 'products';
$table_2 = 'orders';

$query = 'SELECT * FROM ' . $table_1;
$sth = $dbh->prepare($query);
$sth->execute();
$results = $sth->fetchAll(PDO::FETCH_ASSOC);
$ids = [];
foreach ($results as $result) {
    $ids[] = $result['id'];
}

// Моделируем таблицу заказов

for ($i = 0; $i < 10; ++$i) {

    $timeAndDate = '2018-' . mt_rand(3, 5) . '-' . mt_rand(1, 30);
    $rand_id = array_rand($ids);
    $product_id = $ids[$rand_id];

    $sth = $dbh->prepare(' INSERT INTO ' . $table_2 . '
    VALUES (NULL,  :timeAndDate, :product_id)');
    $sth->execute([':timeAndDate' => $timeAndDate, ':product_id' => $product_id]);
}