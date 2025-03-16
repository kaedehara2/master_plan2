Master Plan 2

Master Plan 2 adalah aplikasi manajemen rencana yang dikembangkan menggunakan Flutter dengan pendekatan State Management menggunakan Provider. Aplikasi ini memungkinkan pengguna untuk menambahkan, mengedit, dan menandai rencana sebagai selesai dengan tampilan UI yang intuitif dan responsif.

Fitur Utama
-Menampilkan daftar rencana dengan tampilan yang bersih dan modern.
-Menambahkan rencana baru dengan satu klik tombol tambah.
-Edit rencana melalui bottom sheet modal yang mempermudah pengubahan nama rencana.
-Checkbox untuk menyelesaikan rencana dengan efek garis coret pada rencana yang sudah selesai.
-State Management menggunakan Provider untuk memastikan data selalu sinkron dan terupdate secara real-time.

Teknologi yang Digunakan

Flutter (Framework utama)

Dart (Bahasa pemrograman)

Provider (State management)

Struktur Folder

master_plan2/
│── lib/
│   ├── main.dart                 # Entry point aplikasi
│   ├── screens/
│   │   ├── plan_screen.dart       # UI utama aplikasi
│   ├── models/
│   │   ├── plan.dart              # Model untuk rencana
│   │   ├── task.dart              # Model untuk tugas dalam rencana
│   ├── providers/
│   │   ├── plan_provider.dart     # Provider untuk mengelola state aplikasi
│   ├── widgets/
│   │   ├── plan_tile.dart         # Widget untuk menampilkan item daftar rencana
│── pubspec.yaml                   # File konfigurasi dependencies

Cara Menjalankan Aplikasi

Pastikan Flutter telah terinstal di perangkat Anda.
Clone repository ini atau pindahkan kode ke direktori proyek Flutter Anda.
Jalankan perintah berikut di terminal:

flutter pub get
flutter run

Screenshot Aplikasi

### **Halaman Utama**
![Home Screen](assets/screenshots/homescreen.jpeg)

Tampilan ketika sudah diisi rencana =

![Home Screen](assets/screenshots/isirencana.jpeg)


Kontribusi

Jika ingin berkontribusi, silakan lakukan fork repository ini dan ajukan pull request dengan perubahan yang Anda buat.

Lisensi

Aplikasi ini dikembangkan untuk keperluan pembelajaran dan bebas digunakan sesuai kebutuhan.

Dibuat dengan ❤️ menggunakan Flutter.

