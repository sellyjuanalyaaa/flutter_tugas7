# Sellyjuan Alya Rosalina H1D023006 Shift A/C

# Tugas 7 Praktikum Pemrograman Mobile - Flutter App

Aplikasi ini dikembangkan untuk memenuhi Tugas 7 mata kuliah Praktikum Pemrograman Mobile. Aplikasi ini merupakan simulasi sistem manajemen sederhana yang menerapkan konsep **Routing**, **Layouting**, **State Management**, dan **Local Storage** menggunakan `Shared Preferences`.

Didesain menggunakan gaya **Material 3** untuk tampilan yang modern dan responsif.

## Fitur Utama

* **Sistem Login Sederhana**: Validasi username dan password statis.
* **Dashboard Interaktif**: Menu navigasi berbasis Grid untuk akses cepat.
* **Side Menu (Drawer)**: Navigasi slide-out yang mencakup profil singkat pengguna.
* **Manajemen Profil**:
    * Menampilkan informasi pengguna.
    * Fitur ganti foto profil (menggunakan `image_picker`) yang tersimpan secara lokal.
* **Catatan (Notes)**:
    * Membuat catatan baru.
    * Menghapus catatan.
    * Data catatan tersimpan permanen (persist) meski aplikasi ditutup.
* **Log Aktivitas**: Tampilan timeline sederhana untuk riwayat aktivitas.
* **Pengaturan (Settings)**:
    * Toggle Notifikasi.
    * Toggle Dark Mode (Tema Gelap).
    * Status pengaturan tersimpan otomatis.
* **Tentang Aplikasi**: Informasi versi dan deskripsi aplikasi.

## Akun Demo

Gunakan kredensial berikut untuk masuk ke dalam aplikasi:

* **Username**: `admin`
* **Password**: `admin`

## Struktur Proyek

```text
lib/
├── about_page.dart     # Halaman Tentang Aplikasi
├── activity_page.dart  # Halaman Riwayat Aktivitas (Timeline)
├── home_page.dart      # Halaman Utama (Dashboard)
├── login_page.dart     # Halaman Login
├── main.dart           # Entry point & Konfigurasi Tema (Material 3)
├── note_page.dart      # Halaman Catatan (CRUD sederhana)
├── profile_page.dart   # Halaman Profil User
├── setting_page.dart   # Halaman Pengaturan (Shared Prefs)
└── sidemenu.dart       # Widget Drawer Navigasi
