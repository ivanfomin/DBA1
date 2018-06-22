<?php


$dbname = 'postgres';
$host = '127.0.0.1';
$dbuser = 'postgres';
$dbpass = 'postgres';

$dbh = new PDO("pgsql:dbname=$dbname;host=$host", $dbuser, $dbpass);

$table = 'products';

$query = 'SELECT * FROM ' . $table;
$sth = $dbh->prepare($query);
$sth->execute();
$results = $sth->fetchAll(PDO::FETCH_ASSOC);
$numbers = [1, 2, 3];

foreach ($results as $result) {
    $number_1 = array_rand($numbers);
    $number_2 = array_rand($numbers);
    if($number_1 != $number_2) {
        $sth = $dbh->prepare( 'UPDATE ' . $table .' SET categories[1] = :number_1,
         categories[2] = :number_2 WHERE id = :id');
            $sth->execute([':number_1'=>$number_1, ':number_2'=>$number_2, ':id'=>$result['id']]);
    } else {
         $sth = $dbh->prepare( 'UPDATE ' . $table .' SET categories[1] = :number_1 WHERE id = :id');
            $sth->execute([':number_1'=>$number_1, ':id'=>$result['id']]);
    }
}
