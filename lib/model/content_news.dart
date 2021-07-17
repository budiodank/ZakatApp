class ContentNews {
  String title;
  String writer;
  String category;
  String createDate;
  String content;
  String imageAsset;

  ContentNews({
    required this.title,
    required this.writer,
    required this.category,
    required this.createDate,
    required this.content,
    required this.imageAsset,
  });
}

var contentNewsList = [
  ContentNews(
    title: 'BAZNAS Bantu Petani Mustahik Mengantisipasi Hama Tanaman',
    writer: 'LPEM',
    category: 'Pemberdayaan Ekonomi',
    createDate: '18 Juni 2021',
    content:
    'Adwa (63), salah satu petani bawang merah binaan Lembaga Pemberdayaan Ekonomi Mustahik (LPEM) BAZNAS yang berlokasi di Kelurahan Widarasari, Kecamatan Kramatmulya, Kabupaten Kuningan, Jawa Barat, melakukan perawatan tanaman menggunakan insektisida sistemik dalam pencegahan penyerangan hama di lahan seluas 0,14ha, pada Selasa (15/6). Insektisida adalah pestisida yang digunakan untuk penanganan atau pengendalian hama pada tanaman. Terdapat dua jenis insektisida kontak lambu dan sistemik, untuk serangan hama yang ada di permukaan bisa menggunakan kontak lambu sedangkan untuk yang di dalam tumbuhan misal daun harus menggunakan yang sistemik.',
    imageAsset: 'images/baznas_bertani.jpeg',
  ),
  ContentNews(
    title: 'Mustahik Binaan BAZNAS Akan Berkurban pada Idul Adha 1442 H',
    writer: 'ZCD',
    category: 'Community Development',
    createDate: '17 Juni 2021',
    content:
    'Umat muslim di seluruh dunia tak lama lagi akan merayakan Hari Raya Idul Adha yang jatuh tiap tanggal 10 Dzulhijjah. Badan Amil Zakat Nasional (BAZNAS) terus berupaya memperhatikan kesejahteraan masyarakat, termasuk mutahik binaan lembaga program Zakat Community Development (ZCD) BAZNAS di Desa Beting, Kecamatan Rangsang Pesisir, Kabupaten Kepulauan Meranti, Riau. Dalam pemberdayaan di Desa Beting, BAZNAS memberikan hewan ternak kepada kelompok mustahik.',
    imageAsset: 'images/baznas_berkurban.jpeg',
  ),
  ContentNews(
    title: 'Sosok Pahlawan Tersembunyi Sekolah Cendekia BAZNAS',
    writer: 'SCB',
    category: 'Sekolah Cendekia',
    createDate: '17 Juni 2021',
    content:
    'Pahlawan tidak selalu berorientasi pada seseorang yang berhasil menciptakan gerakan besar untuk negaranya. Sosok pahlawan yang sesungguhnya yaitu pahlawan yang bekerja dengan sepenuh hati agar bermanfaat bagi setiap orang. Walaupun manfaatnya tidak berdampak besar. Seperti apa yang dilaksanakan Agung Cahyana, Teknisi Sekolah Cendekia BAZNAS (SCB).',
    imageAsset: 'images/baznas_pahlawan.jpeg',
  ),
];