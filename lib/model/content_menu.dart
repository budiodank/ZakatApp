class ContentMenu {
  String nameMenu;
  String description;
  String imageIcon;
  String imageAsset;

  ContentMenu({
    required this.nameMenu,
    required this.description,
    required this.imageIcon,
    required this.imageAsset,
  });
}

var contentMenuList = [
  ContentMenu(
    nameMenu: 'Zakat Fitrah',
    description: 'Zakat fitrah (zakat al-fitr) adalah zakat yang diwajibkan atas setiap jiwa baik lelaki dan perempuan muslim yang dilakukan pada bulan Ramadhan pada Idul Fitri.'
        'Zakat fitrah wajib ditunaikan bagi setiap jiwa, dengan syarat beragama Islam, hidup pada saat bulan Ramadhan, dan memiliki kelebihan rezeki atau kebutuhan pokok untuk malam dan Hari Raya Idul Fitri. Besarannya adalah beras atau makanan pokok seberat 2,5 kg atau 3,5 liter per jiwa.',
    imageIcon: 'images/donation.svg',
    imageAsset: 'images/zakat_fitrah.jpg',
  ),
  ContentMenu(
    nameMenu: 'Zakat Maal',
    description: 'Maal berasal dari kata bahasa Arab artinya harta atau kekayaan (al-amwal, jamak dari kata maal) adalah “segala hal yang diinginkan manusia untuk disimpan dan dimiliki” (Lisan ul-Arab). Menurut Islam sendiri, harta merupakan sesuatu yang boleh atau dapat dimiliki dan digunakan (dimanfaatkan) sesuai kebutuhannya.'
        'Oleh karena itu dalam pengertiannya, zakat maal berarti zakat yang dikenakan atas segala jenis harta, yang secara zat maupun substansi perolehannya tidak bertentangan dengan ketentuan agama.',
    imageIcon: 'images/help.svg',
    imageAsset: 'images/zakat_maal.jpg',
  ),
  ContentMenu(
    nameMenu: 'Fidyah',
    description: 'Fidyah diambil dari kata “fadaa” artinya mengganti atau menebus. Bagi beberapa orang yang tidak mampu menjalankan ibadah puasa dengan kriteria tertentu, diperbolehkan tidak berpuasa serta tidak harus menggantinya di lain waktu. Namun, sebagai gantinya diwajibkan untuk membayar fidyah.'
        'Menurut Imam Malik, Imam As-Syafi\'I, fidyah yang harus dibayarkan sebesar 1 mud gandum (kira-kira 6 ons = 675 gram = 0,75 kg atau seukuran telapak tangan yang ditengadahkan saat berdoa).',
    imageIcon: 'images/food.svg',
    imageAsset: 'images/fidyah_img.jpg',
  ),
  ContentMenu(
    nameMenu: 'Infaq',
    description: 'Infaq adalah harta yang dikeluarkan oleh seseorang atau badan usaha di luar zakat untuk kemaslahatan umum (Menurut Undang-Undang Nomor 23 Tahun 2011 tentang Pengelolaan Zakat pada BAB I Pasal 1). infak merupakan amalan yang tak bisa lepas dari kehidupan sehari-hari seorang Muslim. Infaq berasal dari Bahasa Arab, "anfaqa" yang berarti membelanjakan harta atau memberikan harta. Sedangkan Infaq berarti keluarkanlah harta.',
    imageIcon: 'images/charity.svg',
    imageAsset: 'images/infaq_img.jpg',
  ),
];