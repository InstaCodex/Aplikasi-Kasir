<?php
// Buat koneksi ke database
require "../functions.php";

// Cek koneksi
if (!$c) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}

// Query SQL untuk mengambil data laporan
$query = "SELECT * FROM laporan";
$result = mysqli_query($c, $query);

if (!$result) {
    die('Query error: ' . mysqli_error($c));
}

// Header untuk menghasilkan file Excel
header('Content-Type: application/vnd-ms-excel');
header('Content-Disposition: attachment; filename="laporan.xls"');

// Tulis header untuk file Excel
echo "ID Laporan\tKode Produk\tNama Produk\tNama Pelanggan\tHarga\tQty\tSubtotal\tWaktu Transaksi\n";

// Loop untuk menulis data ke dalam file Excel
while ($row = mysqli_fetch_assoc($result)) {
    echo $row['idlaporan'] . "\t";
    echo $row['kode_produk'] . "\t";
    echo $row['nama_produk'] . "\t";
    echo $row['nama_pelanggan'] . "\t";
    echo $row['harga'] . "\t";
    echo $row['qty'] . "\t";
    echo $row['subtotal'] . "\t";
    echo $row['waktu_transaksi'] . "\n";
}
?>
