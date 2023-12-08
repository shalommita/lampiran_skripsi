<?php
session_abort();

require_once 'koneksi.php';

$servername = "localhost";
$database = "dashboard_sahabat";
$username = "root";
$password = "";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Formulir Evaluasi Emosional
    $idEmosional = $_POST['idEmosional'];
    $idKlienEmosional = $_POST['idKlienEmosional'];
    $idJadwalEmosional = $_POST['idJadwalEmosional'];
    $idPemantauEmosional = $_POST['idPemantauEmosional'];
    $catatanEvaluasiEmosional = $_POST['catatanEvaluasiEmosional'];
    $kategoriEmosional = $_POST['kategoriEmosional'];
    $skorEmosional = $_POST['skorEmosional'];
    $waktuCatatEmosional = $_POST['waktuCatatEmosional'];

    $idKognitif = $_POST['idKognitif'];
    $idKlienKognitif = $_POST['idKlienKognitif'];
    $idJadwalKognitif = $_POST['idJadwalKognitif'];
    $idPemantauKognitif = $_POST['idPemantauKognitif'];
    $catatanEvaluasiKognitif = $_POST['catatanEvaluasiKognitif'];
    $kategoriKognitif = $_POST['kategoriKognitif'];
    $skorKognitif = $_POST['skorKognitif'];
    $waktuCatatKognitif = $_POST['waktuCatatKognitif'];

    $idPerilaku = $_POST['idPerilaku'];
    $idKlienPerilaku = $_POST['idKlienPerilaku'];
    $idJadwalPerilaku = $_POST['idJadwalPerilaku'];
    $idPemantauPerilaku = $_POST['idPemantauPerilaku'];
    $catatanEvaluasiPerilaku = $_POST['catatanEvaluasiPerilaku'];
    $kategoriPerilaku = $_POST['kategoriPerilaku'];
    $skorPerilaku = $_POST['skorPerilaku'];
    $waktuCatatPerilaku = $_POST['waktuCatatPerilaku'];

    $idMedis = $_POST['idMedis'];
    $idKlienMedis = $_POST['idKlienMedis'];
    $idJadwalMedis = $_POST['idJadwalMedis'];
    $idPemantauMedis = $_POST['idPemantauMedis'];
    $catatanEvaluasiMedis = $_POST['catatanEvaluasiMedis'];
    $kategoriMedis = $_POST['kategoriMedis'];
    $skorMedis = $_POST['skorMedis'];
    $waktuCatatMedis = $_POST['waktuCatatMedis'];
    $obatDiminum = $_POST['obatDiminum'];
    $dosisObat = $_POST['dosisObat'];

    echo "$idEmosional <br>";
    echo "$idKlienEmosional <br>";
    echo "$idJadwalEmosional <br>";
    echo "$idPemantauEmosional <br>";
    echo "$catatanEvaluasiEmosional <br>";
    echo "$kategoriEmosional <br>";
    echo "$skorEmosional <br>";
    echo "$waktuCatatEmosional <br>";

    $sql = "INSERT INTO evalEmosional (idEmosi, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    VALUES ($idEmosional, $idKlienEmosional, $idJadwalEmosional, $idPemantauEmosional, '$catatanEvaluasiEmosional', '$kategoriEmosional', $skorEmosional, '$waktuCatatEmosional');
    
    INSERT INTO evalKognitif (idKognitif, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    VALUES ('$idKognitif', $idKlienKognitif, $idJadwalKognitif, $idPemantauKognitif, '$catatanEvaluasiKognitif', '$kategoriKognitif', $skorKognitif, '$waktuCatatKognitif');

    INSERT INTO evalPerilaku (idPerilaku, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    VALUES ('$idPerilaku', $idKlienPerilaku, $idJadwalPerilaku, $idPemantauPerilaku, '$catatanEvaluasiPerilaku', '$kategoriPerilaku', $skorPerilaku, '$waktuCatatPerilaku');

    INSERT INTO evalMedis (idMedis, idKlien, idJadwal, idPemantau, catatanEval, obatDiminum, dosisObat, kategori, skor, waktuCatat)
    VALUES ('$idMedis', $idKlienMedis, $idJadwalMedis, $idPemantauMedis, '$catatanEvaluasiMedis', '$obatDiminum', '$dosisObat', '$kategoriMedis', $skorMedis, '$waktuCatatMedis');
    ";

    // if (!empty($idEmosional)) {
    //   $idEmosional = $_POST['idEmosional'];

    //   $sql1 = "INSERT INTO evalEmosional (idEmosi, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    //          VALUES ($idEmosional, $idKlienEmosional, $idJadwalEmosional, $idPemantauEmosional, '$catatanEvaluasiEmosional', '$kategoriEmosional', $skorEmosional, '$waktuCatatEmosional')";
    // } 
    // if (!empty($idKognitif)) {
    //     $idKognitif = $_POST['idKognitif'];

    //     $sql2 = "INSERT INTO evalKognitif (idKognitif, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    //             VALUES ('$idKognitif', $idKlienKognitif, $idJadwalKognitif, $idPemantauKognitif, '$catatanEvaluasiKognitif', '$kategoriKognitif', $skorKognitif, '$waktuCatatKognitif')";
    // }
    // if (!empty($idPerilaku)) {
    //   $idPerilaku = $_POST['idPerilaku'];

    //   $sql3 = "INSERT INTO evalPerilaku (idPerilaku, idKlien, idJadwal, idPemantau, catatanEval, kategori, skor, waktuCatat)
    //           VALUES ('$idPerilaku', $idKlienPerilaku, $idJadwalPerilaku, $idPemantauPerilaku, '$catatanEvaluasiPerilaku', '$kategoriPerilaku', $skorPerilaku, '$waktuCatatPerilaku')";
    // } 
    // if (!empty($idMedis)) {
    //     $idMedis = $_POST['idMedis'];

    //     $sql4 = "INSERT INTO evalMedis (idMedis, idKlien, idJadwal, idPemantau, catatanEval, obatDiminum, dosisObat, kategori, skor, waktuCatat)
    //             VALUES ('$idMedis', $idKlienMedis, $idJadwalMedis, $idPemantauMedis, '$catatanEvaluasiMedis', '$obatDiminum', '$dosisObat', '$kategoriMedis', $skorMedis, '$waktuCatatMedis')";
    // }

    if ($conn->multi_query($sql) !== TRUE) {
      echo "Error: " . $sql . "<br>" . $conn->error;
    } else {
        // mysqli_multi_query($conn, $sql);
        $conn->multi_query($sql);
        // mysqli_query($sql1, $con);
        // mysqli_query($sql2, $con);
        // mysqli_query($sql3, $con);
        // mysqli_query($sql4, $con);
        // Simpan informasi yang diperlukan dalam session
        $_SESSION['lastInsertedId'] = $conn->insert_id;
    }
  
}

$conn->close();
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Pondok Pemulihan</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">



    <!-- Bootstrap core CSS -->
    <link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rqDRuBu40AqDpeiZm3pO58DJMCWeI3pbCkYbWEWt8bbKh1WLAqD58pD1K0FO5+Fw" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">



    <style>
    * {
      box-sizing: border-box;
    }

    body {
      background-color: #ffffff;
    }

    #regForm {
      background-color: #ffffff;
      margin: 100px auto;
      font-family: Raleway;
      padding: 40px;
      width: 70%;
      min-width: 300px;
    }

    h1 {
      text-align: center;  
    }

    input {
      padding: 10px;
      width: 100%;
      font-size: 17px;
      font-family: Raleway;
      border: 1px solid #aaaaaa;
    }

    /* Mark input boxes that gets an error on validation: */
    input.invalid {
      background-color: #ffdddd;
    }

    select,
    input[type="number"],
    textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }

    /* Hide all steps by default: */
    .tab {
      display: none;
    }

    button {
      background-color: orange;
      color: #ffffff;
      border: none;
      padding: 10px 20px;
      font-size: 17px;
      font-family: Raleway;
      cursor: pointer;
    }

    button:hover {
      opacity: 0.8;
    }

    #prevBtn {
      background-color: orange;
    }

    /* Make circles that indicate the steps of the form: */
    .step {
      height: 15px;
      width: 15px;
      margin: 0 2px;
      background-color: #bbbbbb;
      border: none;  
      border-radius: 50%;
      display: inline-block;
      opacity: 0.5;
    }

    .step.active {
      opacity: 1;
    }

    /* Mark the steps that are finished and valid: */
    .step.finish {
      background-color: #04AA6D;
    }
    </style>

    <!-- Custom styles for this template -->
    <link href="assets/css/dashboard.css" rel="stylesheet">
</head>

<body>

    <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Pondok Pemulihan</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </header>

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-dark text-white sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.php">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="jadwal.php">
                                Jadwal Harian
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="catatanEval.php">
                                Catatan Harian
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dataKlien.php">
                                Data Klien
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dataPemantau.php">
                                Data Pemantau
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.php">
                                Keluar
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <br><br>
                <div class="container-fluid">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="catatanEval.php">Catatan Evaluasi</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Tambah Catatan Baru</li>
                        </ol>
                    </nav>
                <!-- isi konten -->
                <div class="row mt-4">
                    <div class="col">
                        <div class="card">
                            <form id="regForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST" enctype="multipart/form-data">
                                <!-- One "tab" for each step in the form: -->
                                <div class="tab">
                                <h1>Pengisian Form Evaluasi Emosional</h1>
                                  <h4>ID Emosi:</h4>
                                  <p><input type="number" placeholder="Masukkan ID Emosi (angka)"  oninput="this.className = ''" name="idEmosional"></p>
                                  <h4>Nama Klien:</h4>
                                  <p>
                                    <select placeholder="Pilih Klien" oninput="this.className = ''" name="idKlienEmosional">
                                        <option value="1">Ariska Lola Priadi</option>
                                        <option value="2">Revyanto</option>
                                    </select>
                                  </p>
                                  <h4>Jadwal:</h4>
                                  <p>
                                    <select placeholder="Pilih Jadwal" oninput="this.className = ''" name="idJadwalEmosional">
                                        <option value="1">Doa pagi</option>
                                        <option value="2">Senam pagi</option>
                                        <option value="3">Terapi kerja</option>
                                    </select>
                                  </p>
                                  <h4>Nama Pemantau:</h4>
                                  <p>
                                    <select placeholder="Pilih Pemantau" oninput="this.className = ''" name="idPemantauEmosional">
                                        <option value="1">Ngizthy R.W. Nalle</option>
                                        <option value="2">Kak Tika</option>
                                        <option value="3">Alfred Abanat</option>
                                        <option value="4">Kak Esa</option>
                                    </select>
                                  </p>
                                  <h4>Catatan Evaluasi:</h4>
                                  <p><textarea placeholder="Masukkan Catatan Evaluasi" oninput="this.className = ''" name="catatanEvaluasiEmosional"></textarea></p>
                                  <h4>Pilih Kategori:</h4>
                                  <p>
                                      <select placeholder="Kategori" oninput="this.className = ''" name="kategoriEmosional">
                                          <option value="Salomo">Salomo</option>
                                          <option value="Victory">Victory</option>
                                          <option value="Istimewa">Istimewa</option>
                                      </select>
                                  </p>
                                  <h4>Skor Emosi:</h4>
                                  <p><input type="number" placeholder="Skor" oninput="this.className = ''" name="skorEmosional"></p>
                                  <h4>Waktu Catat:</h4>
                                  <p><input type="datetime-local" placeholder="Waktu Catat" oninput="this.className = ''" name="waktuCatatEmosional"></p>
                                </div>

                                <!-- One "tab" for each step in the form: -->
                                <div class="tab">
                                  <h1>Pengisian Form Evaluasi Kognitif</h1>
                                  <h4>ID Kognitif:</h4>
                                  <p><input type="number" placeholder="Masukkan ID Emosi (angka)" oninput="this.className = ''" name="idKognitif"></p>
                                  <h4>Nama Klien:</h4>
                                  <p>
                                    <select placeholder="Pilih Klien" oninput="this.className = ''" name="idKlienKognitif">
                                        <option value="1">Ariska Lola Priadi</option>
                                        <option value="2">Revyanto</option>
                                    </select>
                                  </p>
                                  <h4>Jadwal:</h4>
                                  <p>
                                    <select placeholder="Pilih Jadwal" oninput="this.className = ''" name="idJadwalKognitif">
                                        <option value="1">Doa pagi</option>
                                        <option value="2">Senam pagi</option>
                                        <option value="3">Terapi kerja</option>
                                    </select>
                                  </p>
                                  <h4>Nama Pemantau:</h4>
                                  <p>
                                    <select placeholder="Pilih Pemantau" oninput="this.className = ''" name="idPemantauKognitif">
                                        <option value="1">Ngizthy R.W. Nalle</option>
                                        <option value="2">Kak Tika</option>
                                        <option value="3">Alfred Abanat</option>
                                        <option value="4">Kak Esa</option>
                                    </select>
                                  </p>
                                  <h4>Catatan Evaluasi:</h4>
                                  <p><textarea placeholder="Masukkan Catatan Evaluasi" oninput="this.className = ''" name="catatanEvaluasiKognitif"></textarea></p>
                                  <h4>Pilih Kategori:</h4>
                                  <p>
                                      <select placeholder="Kategori" oninput="this.className = ''" name="kategoriKognitif">
                                          <option value="Salomo">Salomo</option>
                                          <option value="Victory">Victory</option>
                                          <option value="Istimewa">Istimewa</option>
                                      </select>
                                  </p>
                                  <h4>Skor Kognitif:</h4>
                                  <p><input type="number" placeholder="Skor" oninput="this.className = ''" name="skorKognitif"></p>
                                  <h4>Waktu Catat:</h4>
                                  <p><input type="datetime-local" placeholder="Waktu Catat" oninput="this.className = ''" name="waktuCatatKognitif"></p>
                                </div>

                                <!-- One "tab" for each step in the form: -->
                                <div class="tab">
                                  <h1>Pengisian Form Evaluasi Perilaku</h1>
                                  <h4>ID Perilaku:</h4>
                                  <p><input type="number" placeholder="Masukkan ID Emosi (angka)" oninput="this.className = ''" name="idPerilaku"></p>
                                  <h4>Nama Klien:</h4>
                                  <p>
                                    <select placeholder="Pilih Klien" oninput="this.className = ''" name="idKlienPerilaku">
                                        <option value="1">Ariska Lola Priadi</option>
                                        <option value="2">Revyanto</option>
                                    </select>
                                  </p>
                                  <h4>Jadwal:</h4>
                                  <p>
                                    <select placeholder="Pilih Jadwal" oninput="this.className = ''" name="idJadwalPerilaku">
                                        <option value="1">Doa pagi</option>
                                        <option value="2">Senam pagi</option>
                                        <option value="3">Terapi kerja</option>
                                    </select>
                                  </p>
                                  <h4>Nama Pemantau:</h4>
                                  <p>
                                    <select placeholder="Pilih Pemantau" oninput="this.className = ''" name="idPemantauPerilaku">
                                        <option value="1">Ngizthy R.W. Nalle</option>
                                        <option value="2">Kak Tika</option>
                                        <option value="3">Alfred Abanat</option>
                                        <option value="4">Kak Esa</option>
                                    </select>
                                  </p>
                                  <h4>Catatan Evaluasi:</h4>
                                  <p><textarea placeholder="Masukkan Catatan Evaluasi" oninput="this.className = ''" name="catatanEvaluasiPerilaku"></textarea></p>
                                  <h4>Pilih Kategori:</h4>
                                  <p>
                                      <select placeholder="Kategori" oninput="this.className = ''" name="kategoriPerilaku">
                                          <option value="Salomo">Salomo</option>
                                          <option value="Victory">Victory</option>
                                          <option value="Istimewa">Istimewa</option>
                                      </select>
                                  </p>
                                  <h4>Skor Perilaku:</h4>
                                  <p><input type="number" placeholder="Skor" oninput="this.className = ''" name="skorPerilaku"></p>
                                  <h4>Waktu Catat:</h4>
                                  <p><input type="datetime-local" placeholder="Waktu Catat" oninput="this.className = ''" name="waktuCatatPerilaku"></p>
                                </div>

                                <!-- One "tab" for each step in the form: -->
                                <div class="tab">
                                <h1>Pengisian Form Evaluasi Medis</h1>
                                  <h4>ID Medis:</h4>
                                  <p><input type="number" placeholder="Masukkan ID Emosi (angka)" oninput="this.className = ''" name="idMedis"></p>
                                  <h4>Nama Klien:</h4>
                                  <p>
                                    <select placeholder="Pilih Klien" oninput="this.className = ''" name="idKlienMedis">
                                        <option value="1">Ariska Lola Priadi</option>
                                        <option value="2">Revyanto</option>
                                    </select>
                                  </p>
                                  <h4>Jadwal:</h4>
                                  <p>
                                    <select placeholder="Pilih Jadwal" oninput="this.className = ''" name="idJadwalMedis">
                                        <option value="1">Doa pagi</option>
                                        <option value="2">Senam pagi</option>
                                        <option value="3">Terapi kerja</option>
                                    </select>
                                  </p>
                                  <h4>Nama Pemantau:</h4>
                                  <p>
                                    <select placeholder="Pilih Pemantau" oninput="this.className = ''" name="idPemantauMedis">
                                        <option value="1">Ngizthy R.W. Nalle</option>
                                        <option value="2">Kak Tika</option>
                                        <option value="3">Alfred Abanat</option>
                                        <option value="4">Kak Esa</option>
                                    </select>
                                  </p>
                                  <h4>Catatan Evaluasi:</h4>
                                  <p><textarea placeholder="Masukkan Catatan Evaluasi" oninput="this.className = ''" name="catatanEvaluasiMedis"></textarea></p>
                                  <h4>Pilih Kategori:</h4>
                                  <p>
                                      <select placeholder="Kategori" oninput="this.className = ''" name="kategoriMedis">
                                          <option value="Salomo">Salomo</option>
                                          <option value="Victory">Victory</option>
                                          <option value="Istimewa">Istimewa</option>
                                      </select>
                                  </p>
                                  <h4>Skor Medis (0 atau 100):</h4>
                                  <p><input type="number" placeholder="Skor" oninput="this.className = ''" name="skorMedis"></p>
                                  <h4>Waktu Catat:</h4>
                                  <p><input type="datetime-local" placeholder="Waktu Catat" oninput="this.className = ''" name="waktuCatatMedis"></p>
                                </div>
                                <div style="overflow:auto;">
                                  <div style="float:right;">
                                    <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                                    <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                                  </div>
                                </div>
                                <!-- Circles which indicates the steps of the form: -->
                                <div style="text-align:center;margin-top:40px;">
                                  <span class="step"></span>
                                  <span class="step"></span>
                                  <span class="step"></span>
                                  <span class="step"></span>
                                </div>

                                <script>
                                    // Setelah DOM dimuat
                                    document.addEventListener('DOMContentLoaded', function () {
                                        console.log('halo')
                                        <?php
                                        // Periksa apakah session lastInsertedId ada
                                        if (!empty($_SESSION['lastInsertedId'])) {
                                            // Isi kembali nilai formulir
                                            echo "document.getElementsByName()[0].value = " . $_SESSION['lastInsertedId'] . ";";
                                            // Hapus session untuk mencegah pengisian ulang
                                            unset($_SESSION['lastInsertedId']);
                                        }
                                        ?>
                                    });
                                </script>
                              </form>

                              <script>
                              var currentTab = 0; // Current tab is set to be the first tab (0)
                              showTab(currentTab); // Display the current tab

                              function showTab(n) {
                                // This function will display the specified tab of the form...
                                var x = document.getElementsByClassName("tab");
                                x[n].style.display = "block";
                                //... and fix the Previous/Next buttons:
                                if (n == 0) {
                                  document.getElementById("prevBtn").style.display = "none";
                                } else {
                                  document.getElementById("prevBtn").style.display = "inline";
                                }
                                if (n == (x.length - 1)) {
                                  document.getElementById("nextBtn").innerHTML = "Submit";
                                } else {
                                  document.getElementById("nextBtn").innerHTML = "Next";
                                }
                                //... and run a function that will display the correct step indicator:
                                fixStepIndicator(n)
                              }

                              async function nextPrev(n) {
                                // This function will figure out which tab to display
                                var x = document.getElementsByClassName("tab");
                                console.log('jmlnya',x)
                                // Exit the function if any field in the current tab is invalid:
                                if (n == 1 && !validateForm()) return false;
                                // Hide the current tab:
                                x[currentTab].style.display = "none";
                                // Increase or decrease the current tab by 1:
                                currentTab = currentTab + n;
                                // if you have reached the end of the form...
                                if (currentTab >= x.length) {
                                  // ... the form gets submitted:
                                  document.getElementById("regForm").submit();
                                  return false;
                                }
                                // Otherwise, display the correct tab:
                                showTab(currentTab);
                              }

                              function validateForm() {
                                // This function deals with validation of the form fields
                                var x, y, i, valid = true;
                                x = document.getElementsByClassName("tab");
                                y = x[currentTab].getElementsByTagName("input");
                                // A loop that checks every input field in the current tab:
                                for (i = 0; i < y.length; i++) {
                                  // If a field is empty...
                                  if (y[i].value == "") {
                                    // add an "invalid" class to the field:
                                    y[i].className += " invalid";
                                    // and set the current valid status to false
                                    valid = false;
                                  }
                                }
                                // If the valid status is true, mark the step as finished and valid:
                                if (valid) {
                                  document.getElementsByClassName("step")[currentTab].className += " finish";
                                }
                                return valid; // return the valid status
                              }

                              function fixStepIndicator(n) {
                                // This function removes the "active" class of all steps...
                                var i, x = document.getElementsByClassName("step");
                                for (i = 0; i < x.length; i++) {
                                  x[i].className = x[i].className.replace(" active", "");
                                }
                                //... and adds the "active" class on the current step:
                                x[n].className += " active";
                              }
                              </script>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>


    <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-o53vqJDzg1R6bD5b2XxRl5qmZz9p5ZWFrN1aCk4fFA4gIFBvcR5JNA2yo8hEAAJ3" crossorigin="anonymous"></script>


</body>
</html>