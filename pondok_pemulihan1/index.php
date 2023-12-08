

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
    <!-- <link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .btnMenu button.on {
            background-color: #007bff;
            /* Warna latar belakang untuk tombol aktif */
            color: #fff;
            /* Warna teks untuk tombol aktif */
        }

        .graph {
            padding: 10px;
            flex: 1;
            border: 1px solid #ccc;
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
                            <a class="nav-link active" aria-current="page" href="index.php">
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="jadwal.php">
                                Jadwal Harian
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="catatanEval.php">
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
                <div class="row">
                    <div class="col-md-12 align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <div class="input-group mb-3">
                            <input id="searchInput" type="text" class="form-control" placeholder="Cari nama klien disini" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button onclick="searchKlien()" class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="graph col-lg-6 mb-3">
                        <h6 class="mb-2">Grafik Perkembangan Kondisi Klien terhadap Kepatuhan Obat</h6>
                        <div class="mb-3" style="height: 20px;"></div>
                        <canvas id="chart1" height="150"></canvas>
                    </div>
                    <div class="graph col-lg-6 d-block mb-3">
                        <h6 class="mb-2">Grafik Perbandingan Kondisi Klien Kategori yang Sama</h6>
                        <div class="row my-2 d-flex justify-content-center text-center">
                            <div class="col-lg-12 btnMenu">
                                <button class="btn btn-sm btn-secondary" data-graph-type="evalkognitif" onclick="changeGraph('evalkognitif')">Kognitif</button>
                                <button class="btn btn-sm btn-secondary" data-graph-type="evalemosional" onclick="changeGraph('evalemosional')">Emosional</button>
                                <button class="btn btn-sm btn-secondary" data-graph-type="evalperilaku" onclick="changeGraph('evalperilaku')">Perilaku</button>
                                <button class="btn btn-sm btn-secondary" data-graph-type="evalmedis" onclick="changeGraph('evalmedis')">Medis</button>
                            </div>
                        </div>
                        <canvas id="chart2" height="auto"></canvas>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="graph col-lg-6 mb-3">
                        <div class="row justify-content-between mb-3">
                            <div class="col-md-7">
                                <h6 class="mb-2">Grafik Frekuensi Konflik</h6>
                            </div>
                            <div class="col-md-5">
                                <select id="chartType" class="form-select-sm float-end" aria-label="Default select example">
                                    <option value="daily">Harian</option>
                                    <option value="weekly">Mingguan</option>
                                </select>
                            </div>
                        </div>

                        <canvas id="chart3" height="auto"></canvas>
                    </div>
                    </div>
                </div>

            </main>
        </div>
    </div>


    <!-- <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="assets/js/dashboard.js"></script> -->

    <script>
        let chart;
        let chart2;
        let chart3;
        let selectedGraph = 'evalkognitif'; // Default graph

        function searchKlien() {
            var searchInput = document.getElementById('searchInput').value;

            // Menggunakan Fetch API untuk mendapatkan data Chart 1
            fetch('getDataForChart.php?namaKlien=' + encodeURIComponent(searchInput))
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Gagal mengambil data dari server.');
                    }
                    return response.json();
                    // return response.text();
                })
                .then(data => {
                    // console.log('Response Data:', data);
                    updateChart1(data);
                    console.log("Chart1.1");
                })
                .catch(error => {
                    console.error('ErrorChart1:', error);
                    // console.error(error.message);
                });

            // Menggunakan Fetch API untuk mendapatkan data Chart 3
            fetch('getDataForChart3.php?namaKlien=' + encodeURIComponent(searchInput))
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Gagal mengambil data dari server.');
                    }
                    return response.json();
                    // return response.text();
                })
                .then(data3 => {
                    // console.log('Response Data:', data3);
                    updateChart3(data3);
                    console.log("Chart3.1");
                })
                .catch(error => {
                    console.error('ErrorChart3:', error);
                    // console.error(error.message);
                });

            changeGraph(selectedGraph);
        }

        function changeGraph(graphType) {
            var searchInput = document.getElementById('searchInput').value;
            selectedGraph = graphType;
            if (searchInput) {
                fetch('getDataForChart2.php?namaKlien=' + encodeURIComponent(searchInput) + '&chartType=' + selectedGraph)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Gagal mengambil data dari server.');
                        }
                        return response.json();
                    })
                    .then(data2 => {
                        // console.log('Response Data:', data2);
                        updateChart2(data2);
                        console.log("Chart2.1");
                    })
                    .catch(error => {
                        console.log('ErrorChart2.1:', error);
                        // console.error(error.message);
                    });
            } else {
                fetch('getDataForChart2.php?chartType=' + selectedGraph)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Gagal mengambil data dari server.');
                        }
                        return response.json();
                    })
                    .then(data2 => {
                        // console.log('Response Data:', data2);
                        updateChart2(data2);
                        console.log("Chart2.2");
                    })
                    .catch(error => {
                        console.log('ErrorChart2.2:', error);
                        // console.error(error.message);
                    });
            }
            updateButtonStyles(selectedGraph);
        }

        function updateButtonStyles(activeGraphType) {
            const buttons = document.querySelectorAll('.btnMenu button');
            buttons.forEach(button => {
                const graphType = button.getAttribute('data-graph-type');
                if (graphType === activeGraphType) {
                    button.classList.add('on');
                } else {
                    button.classList.remove('on');
                }
            });
        }

        function updateChart1(data) {
            var ctx = document.getElementById('chart1').getContext('2d');
            var emosionalData = data.emosional;
            var kognitifData = data.kognitif;
            var perilakuData = data.perilaku;
            var medisData = data.medis;

            if (chart) {
                chart.destroy();
            }

            chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: emosionalData.map(entry => entry.tanggal),
                    datasets: [{
                            label: 'Emosional',
                            data: emosionalData.map(entry => ({
                                x: entry.tanggal,
                                y: entry.emosionalScore,
                                kategori: entry.kategori,
                                ringkasan: entry.eval,
                            })),
                            borderColor: `rgba(0, 29, 255, 0.8)`,
                            backgroundColor: 'rgba(0, 29, 255, 0.8)',
                            type: 'line',
                        },
                        {
                            label: 'Kognitif',
                            data: kognitifData.map(entry => ({
                                x: entry.tanggal,
                                y: entry.kognitifScore,
                                kategori: entry.kategori,
                                ringkasan: entry.eval,
                            })),
                            borderColor: `rgba(255, 0, 35, 0.8)`,
                            backgroundColor: `rgba(255, 0, 35, 0.8)`,
                            type: 'line',
                        },
                        {
                            label: 'Perilaku',
                            data: perilakuData.map(entry => ({
                                x: entry.tanggal,
                                y: entry.perilakuScore,
                                kategori: entry.kategori,
                                ringkasan: entry.eval,
                            })),
                            borderColor: `rgba(0, 255, 24, 0.8)`,
                            backgroundColor: 'rgba(0, 255, 24, 0.8)',
                            type: 'line',
                        },
                        {
                            label: 'Medis',
                            data: medisData.map(entry => ({
                                x: entry.tanggal,
                                y: entry.medisScore,
                                kategori: entry.kategori,
                                ringkasan: entry.eval,
                            })),
                            borderColor: `rgba(255, 240, 196, 0.8)`,
                            backgroundColor: 'rgba(255, 240, 196, 0.8)',
                            type: 'bar',
                        },
                    ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            mode: 'nearest',
                            intersect: false,
                            callbacks: {
                                label: function(context) {
                                    const datasetLabel = context.dataset.label || '';
                                    const data = context.dataset.data[context.dataIndex];
                                    // return ` Skor ${datasetLabel}: ${data.y} (Kategori ${datasetLabel}: ${data.kategori}) \nRingkasan Eval ${data.ringkasan} `;
                                    return [
                                        `Skor ${datasetLabel}: ${data.y}`,
                                        `Kategori ${datasetLabel}: ${data.kategori}`,
                                        `Ringkasan Eval: ${data.ringkasan}`
                                    ];
                                },
                            },
                        },
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tanggal'
                            },
                            ticks: {
                                maxTicksLimit: 6
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Skor'
                            },
                            ticks: {
                                beginAtZero: false
                            }
                        }
                    }
                },
            });
        }

        function updateChart2(data2) {
            const datasetsChart2 = [];

            if (data2.graph) {

                datasetsChart2.push({
                    label: selectedGraph === 'evalkognitif' ? 'Kognitif' : selectedGraph === 'evalemosional' ? 'Emosional' : selectedGraph === 'evalperilaku' ? 'Perilaku' : selectedGraph === 'evalmedis' ? 'Medis' : 'Kognitif',
                    data: data2.graph.map(entry => ({
                        x: entry.tanggal,
                        y: entry.score,
                        kategori: entry.kategori,
                        ringkasan: entry.eval,
                    })),
                    borderColor: selectedGraph === 'evalkognitif' ? 'rgba(255, 0, 35, 0.8)' : selectedGraph === 'evalemosional' ? 'rgba(0, 29, 255, 0.8)' : selectedGraph === 'evalperilaku' ? 'rgba(0, 255, 24, 0.8)' : selectedGraph === 'evalmedis' ? 'rgba(255, 240, 196, 0.8)' : 'rgba(255, 0, 35, 0.8)',
                    backgroundColor: selectedGraph === 'evalkognitif' ? 'rgba(255, 0, 35, 0.8)' : selectedGraph === 'evalemosional' ? 'rgba(0, 29, 255, 0.8)' : selectedGraph === 'evalperilaku' ? 'rgba(0, 255, 24, 0.8)' : selectedGraph === 'evalmedis' ? 'rgba(255, 240, 196, 0.8)' : 'rgba(255, 0, 35, 0.8)',
                    fill: false,
                });
            }

            datasetsChart2.push({
                label: selectedGraph === 'evalkognitif' ? 'Rata-rata Kognitif' : selectedGraph === 'evalemosional' ? 'Rata-rata Emosional' : selectedGraph === 'evalperilaku' ? 'Rata-rata Perilaku' : selectedGraph === 'evalmedis' ? 'Rata-rata Medis' : 'Rata-rata Kognitif',
                data: data2.dashedgraph.map(entry => ({
                    x: entry.tanggal,
                    y: entry.score,
                    ringkasan: entry.eval,
                })),
                borderDash: [5, 5],
                borderColor: 'rgba(23, 23, 23, 0.83)',
                backgroundColor: 'rgba(23, 23, 23, 0.83)',
                fill: false
            });

            const config2 = {
                type: 'line',
                data: {
                    labels: data2.dashedgraph.map(entry => entry.tanggal),
                    datasets: datasetsChart2
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            mode: 'nearest',
                            intersect: false,
                            callbacks: {
                                label: function(context) {
                                    const datasetLabel = context.dataset.label || '';
                                    const data = context.dataset.data[context.dataIndex];
                                    // return ` Skor ${datasetLabel}: ${data.y} (Kategori ${datasetLabel}: ${data.kategori}) \nRingkasan Eval ${data.ringkasan} `;
                                    return [
                                        `Skor ${datasetLabel}: ${data.y}`,
                                    ];
                                },
                            },
                        },
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tanggal'
                            },
                            ticks: {
                                maxTicksLimit: 6
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Skor'
                            },
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    }
                },
            };

            var ctx2 = document.getElementById('chart2').getContext('2d');

            if (chart2) {
                chart2.destroy();
            }

            chart2 = new Chart(ctx2, config2);
        }

        function updateChart3(data3) {
            const chartType = document.getElementById('chartType').value;
            const ctx3 = document.getElementById('chart3').getContext('2d');

            if (chart3) {
                chart3.destroy();
            }

            chart3 = new Chart(ctx3, {
                type: 'line',
                data: {
                    labels: data3.map(entry => entry.tanggal),
                    datasets: [{
                        label: 'Frekuensi Konflik',
                        data: data3.map(entry => ({
                            x: entry.tanggal,
                            y: entry.frekuensi,
                            kegiatan: entry.kegiatan,
                            ringkasan: entry.eval,
                        })),
                        borderColor: 'rgba(204, 39, 245, 0.8)',
                        backgroundColor: 'rgba(204, 39, 245, 0.8)',
                        borderWidth: 1,
                        fill: false
                    }, ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            mode: 'nearest',
                            intersect: false,
                            callbacks: {
                                label: function(context) {
                                    const datasetLabel = context.dataset.label || '';
                                    const data = context.dataset.data[context.dataIndex];
                                    return [
                                        `Total ${datasetLabel}: ${data.y}`,
                                        `Kegiatan Konflik: ${data.kegiatan}`,
                                        `Catatan Konflik: ${data.ringkasan}`
                                    ];
                                },
                            },
                        },
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tanggal'
                            },
                            ticks: {
                                maxTicksLimit: chartType === 'weekly' ? 6 : 0 // Atur langkah sesuai dengan interval
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Frekuensi'
                            },
                            ticks: {
                                maxTicksLimit: 8,
                                beginAtZero: false
                            }
                        }
                    }
                }
            });
        }

        // Panggil updateChart1 tanpa data untuk inisialisasi grafik
        updateChart1({
            emosional: [],
            kognitif: [],
            perilaku: [],
            medis: [],
        });

        // Panggil changeGraph untuk updateChart2
        changeGraph(selectedGraph);
        updateButtonStyles(selectedGraph);

        // Panggil updateChart3 tanpa data untuk inisialisasi grafik
        updateChart3([]);
    </script>

</body>

</html>