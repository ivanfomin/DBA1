<?php

$dbname = 'postgres';
$host = '127.0.0.1';
$dbuser = 'postgres';
$dbpass = '321';

$dbh = new PDO("pgsql:dbname=$dbname;host=$host", $dbuser, $dbpass);


$table = 'products';

for ($i = 0; $i < 10; ++$i) {
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

    try {
    $sth = $dbh->prepare(' INSERT INTO ' . $table . ' 
    VALUES (:id,  :title, :vendor, :img, :price, :oldprice,  :bringing, :counts, :categor_id, :brand_id)');
        $sth->bindValue(':id', $i);
    $sth->bindValue(':title', $title);
    $sth->bindValue(':vendor', $vendor);
    $sth->bindValue(':img', $img);
        $sth->bindValue(':price', $price);
        $sth->bindValue(':oldprice', $oldPrice);
        $sth->bindValue(':bringing', $bringing);
        $sth->bindValue(':counts', $count);
        $sth->bindValue(':categor_id', $categor_id);
        $sth->bindValue(':brand_id', $brand_id);
    $sth->execute();
    //echo $dbh->lastInsertId();
} catch (PDOException $exception) {
    $exception->getMessage();
}
}
