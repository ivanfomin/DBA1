<?php

$host = '127.0.0.1';
$db = 'testDB';
$user = 'root';
$pass = '321';
$charset = 'utf8';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$dbh = new PDO($dsn, $user, $pass);

$table_1 = 'products';
$table_2 = 'history';
#каждому товару из таблицы products своя строка в таблице history
$query = 'SELECT * FROM ' . $table_1;
$sth = $dbh->prepare($query);
$sth->execute();
$results = $sth->fetchAll(PDO::FETCH_ASSOC);
$events = ['create', 'price', 'delete'];

foreach ($results as $result) {
    $product_id = $result['id'];
    $event = array_rand($events) + 1;
    $currentPrice = $result['price'];
    if($event != 1) {
        $oldPrice = $result['oldPrice'];
    } else {
        $oldPrice = NULL;
    }
    $timeAndDate = $result['bringing'];
    $sth = $dbh->prepare(' INSERT INTO ' . $table_2 . '
    VALUES (NULL,  :product_id, :event, :oldPrice, :currentPrice, :timeAndDate)');

    $sth->execute([':product_id' => $product_id, ':event' => $event, ':currentPrice' => $currentPrice,
        'oldPrice' => $oldPrice, ':timeAndDate' => $timeAndDate]);
}



