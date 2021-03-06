<?php


$host = '127.0.0.1';
$db = 'testDB';
$user = 'root';
$pass = '321';
$charset = 'utf8';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$dbh = new PDO($dsn, $user, $pass);
$table = 'products';

for ($i = 0; $i < 100; ++$i) {
    if ($i % 2 == 0) {
        $vendor = 'Test' . $i;
    } else {
        $vendor = 'Example' . $i;
    }
    $title = 'Product' . $i;
    $price = mt_rand(1000, 5000);
    $oldPrice = $price - mt_rand(100, 500);
    $img = 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700';
    $bringing = '2018-' . mt_rand(1, 5) . '-' . mt_rand(1, 28);
    $count = mt_rand(0, 100);
    $categor_id = mt_rand(1,3);
    $brand_id = mt_rand(1,4);
    $sth = $dbh->prepare(' INSERT INTO ' . $table . ' 
    VALUES (NULL,  :title, :vendor, :img, :price, :oldPrice,  :bringing, :counts, :categor_id, :brand_id)');
    $sth->execute([':title' => $title, ':vendor' => $vendor, ':img' => $img, ':price' => $price, ':oldPrice' => $oldPrice,
        ':bringing' => $bringing, ':counts' => $count, ':categor_id' => $categor_id, ':brand_id' => $brand_id]);
}