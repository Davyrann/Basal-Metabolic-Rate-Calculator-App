# BMR Calculator – Kelompok Raihan

## Identitas Proyek
- **Nama aplikasi:** BMR Calculator
- **Mata kuliah:** Pemrograman Perangkat Bergerak (PPB)
- **Kelompok:** [Isi nomor/nama kelompok]
- **Anggota (2–3 orang):**
  1. Muhammad Raihan Faza — [NIM]
  2. [Nama Anggota 2] — [NIM]
  3. [Nama Anggota 3, jika ada] — [NIM]

> Ganti bagian dalam tanda kurung siku sesuai identitas kelompok sebelum diunggah ke GitHub.

## Deskripsi
Aplikasi Flutter untuk menghitung **Basal Metabolic Rate (BMR)**, yaitu perkiraan energi yang digunakan tubuh saat istirahat, dengan formula **Mifflin–St Jeor**. Aplikasi dikembangkan dari proyek latihan BMI Calculator. Input terdiri dari jenis kelamin, berat badan (kg), tinggi badan (cm), umur (tahun), dan tingkat aktivitas. Hasil aplikasi adalah BMR (kcal/hari) serta estimasi kebutuhan kalori harian (TDEE = BMR × faktor aktivitas).

### Rumus yang digunakan
- Pria: `BMR = 10 × berat + 6.25 × tinggi − 5 × umur + 5`
- Wanita: `BMR = 10 × berat + 6.25 × tinggi − 5 × umur − 161`
- `TDEE = BMR × faktor aktivitas`
- Berat dalam kg, tinggi dalam cm, umur dalam tahun.
- Rentang umur input aplikasi 15–80 tahun.

## Fitur
- Pemilihan jenis kelamin.
- Pengaturan tinggi badan dengan slider.
- Tombol penambah/pengurang berat badan dan umur.
- Pemilihan tingkat aktivitas untuk menghitung kebutuhan kalori total.
- Halaman hasil BMR, TDEE, dan penjelasan.
- Tombol Re-Calculate untuk kembali ke halaman input.

## Screenshot Aplikasi
Tambahkan screenshot asli aplikasi setelah menjalankannya pada emulator/HP. Simpan file ke folder `screenshots/` dan gunakan nama berikut:

**Halaman input**

![Halaman Input BMR](screenshots/input.png)

**Halaman hasil**

![Halaman Hasil BMR](screenshots/result.png)

> Gambar belum disertakan karena screenshot harus berasal dari aplikasi yang benar-benar berhasil dijalankan.

## Struktur Source Code
```text
lib/
  main.dart                  # Tema dan titik masuk aplikasi
  constants.dart             # Enum, konstanta warna dan aktivitas
  calculator.dart            # Class perhitungan BMR dan TDEE
  components/
    custom_card.dart         # Widget kartu yang dipakai ulang
    icon_card.dart           # Widget ikon gender
    round_icon_button.dart   # Tombol + dan -
    bottom_button.dart       # Tombol aksi bawah
  pages/
    input_page.dart          # Input, state, dan navigasi
    result_page.dart         # Menampilkan BMR dan TDEE
test/
  calculator_test.dart       # Unit test logika perhitungan
```

## Cara Menjalankan di VS Code (Windows)
1. Pastikan Flutter SDK **≥ 3.27** dan Dart SDK **≥ 3.9** tersedia. Periksa dengan `flutter --version` dan `flutter doctor`.
2. Extract ZIP dan **buka folder `BMR_Calculator_Kelompok_Raihan`** lewat VS Code.
3. Bila folder `android/` belum ada, buat kerangka Android: `flutter create --platforms=android --project-name bmi .`
4. Jalankan `flutter pub get`.
5. Sambungkan HP Android dengan USB debugging atau hidupkan emulator, lalu `flutter run`.
6. Jalankan pengujian dengan `flutter test`.
7. Build APK: `flutter build apk --release`. File keluar pada `build/app/outputs/flutter-apk/app-release.apk`.

**Jika sebelumnya memakai proyek BMI yang sama:** Salin `lib/`, `test/`, `pubspec.yaml`, dan `README.md` dari proyek ini ke proyek Flutter lama (backup dahulu); lalu jalankan `flutter clean`, `flutter pub get`, `flutter run`.

## Alur Program
1. `main.dart` memanggil `InputPage`.
2. `InputPage` menyimpan nilai gender, tinggi, berat, umur, dan aktivitas di state.
3. Saat tombol Calculate ditekan, nilai dikirim ke `Calculator`.
4. Class `Calculator` menghitung BMR dengan Mifflin–St Jeor serta TDEE.
5. `Navigator.push()` mengirim hasil melalui constructor `ResultPage`.
6. `ResultPage` menampilkan hasil; tombol Re-Calculate memanggil `Navigator.pop()`.

## Referensi
- https://www.calculator.net/bmr-calculator.html
- https://pub.dev/packages/font_awesome_flutter

## Pengumpulan
- [ ] Identitas 2–3 anggota terisi benar.
- [x] Penjelasan kode melalui komentar.
- [x] README berisi nama proyek dan deskripsi.
- [ ] Screenshot input dan hasil asli ditambahkan.
- [ ] Jalankan serta uji aplikasi di perangkat.
- [ ] Upload proyek ke GitHub.
- [ ] Kumpulkan URL repository sebelum **27 Oktober 2026 pukul 00.00** sesuai tampilan tugas.
