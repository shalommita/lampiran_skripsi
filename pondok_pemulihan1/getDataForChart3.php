<?php
include 'koneksi.php';

$namaKlien = $_GET['namaKlien'];

$sql3 = "SELECT r.idKlien, SUM(CASE WHEN r.konflik = 'Ya' THEN 1 ELSE 0 END) AS frekuensi, DATE_FORMAT(r.tanggalPencatatan, '%d/%m') AS waktuCatatFormatted2, GROUP_CONCAT(k.kegiatan) AS kegiatan,
GROUP_CONCAT(r.catatanKonflik) AS catatanKonflik, d.namaKlien FROM rekapkonflik r JOIN jadwalharian k ON r.idJadwal = k.idJadwal JOIN dataklien d ON r.idKlien = d.idKlien WHERE d.namaKlien = '$namaKlien' AND r.tanggalPencatatan BETWEEN '2023-10-29' AND '2023-11-27' GROUP BY r.tanggalPencatatan";

$result3 = mysqli_query($conn, $sql3);

$data3 = array();

if ($result3->num_rows > 0) {
    while ($row = mysqli_fetch_assoc($result3)) {
        $data3[] = array(
            'idKlien' => $row['idKlien'],
            'tanggal' => $row['waktuCatatFormatted2'],
            'frekuensi' => $row['frekuensi'],
            'kegiatan' => $row['kegiatan'],
            'eval' => $row['catatanKonflik'],
            'namaKlien' => $row['namaKlien'],
        );
    }
}

echo json_encode($data3);
