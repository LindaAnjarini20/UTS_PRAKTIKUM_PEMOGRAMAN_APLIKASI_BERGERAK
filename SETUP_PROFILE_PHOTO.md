# 📸 Setup Foto Profil - MyPorto

Panduan langkah demi langkah untuk menambahkan foto profil ke aplikasi MyPorto Anda.

## 📁 Struktur Folder

```
tugas_uts_pab/
├── assets/
│   └── images/
│       ├── profile.png  ← Letakkan foto Anda di sini
│       └── README.md
├── lib/
├── android/
├── ios/
├── pubspec.yaml
└── ...
```

## 🎯 Langkah-langkah Setup

### 1. Persiapkan Foto Profil Anda
- Format: **PNG, JPG, atau JPEG**
- Ukuran minimum: **300x300 px**
- Ukuran recommended: **500x500 px atau lebih besar**
- Pastikan foto bersih dan profesional

### 2. Letakkan Foto di Folder Assets
1. Buka file manager dan navigasi ke: `assets/images/`
2. Salin/pindahkan foto Anda ke folder tersebut
3. **Ganti nama file menjadi: `profile.png`**

### 3. Refresh Aplikasi
```bash
# Bersihkan build cache
flutter clean

# Jalankan aplikasi
flutter run
```

## ✅ Verifikasi Setup

Setelah menambahkan foto:

1. Buka halaman **"Tentang Saya"**
2. Foto profil Anda seharusnya muncul di atas header biru
3. Jika masih menampilkan icon person, coba:
   - Pastikan nama file adalah **`profile.png`** (case-sensitive)
   - Jalankan `flutter clean` dan `flutter run` lagi
   - Periksa apakah pubspec.yaml sudah mencakup `assets/images/`

## 🖼️ Mengubah Foto Profil

Setelah foto default ditampilkan, Anda bisa:
- Klik icon **kamera berwarna orange** di pojok foto profil
- Pilih **"Kamera"** untuk mengambil foto baru
- Atau pilih **"Galeri"** untuk memilih foto dari perangkat
- Foto yang di-upload akan menggantikan tampilan default

## 📝 Format File yang Didukung

- ✅ **PNG** - Recommended (transparan background)
- ✅ **JPG/JPEG** - Supported
- ❌ **GIF/SVG** - Tidak didukung untuk assets

## 🔧 Troubleshooting

| Masalah | Solusi |
|---------|--------|
| Foto tidak muncul | Periksa nama file: `profile.png` |
| Error saat build | Jalankan `flutter clean` terlebih dahulu |
| Foto terpotong | Gunakan foto dengan aspect ratio 1:1 |
| Masih icon person | Pastikan file `.png` ada di `assets/images/` |

## 💡 Tips

- Gunakan foto berwarna (tidak grayscale) untuk hasil yang lebih baik
- Foto akan di-crop menjadi lingkaran, jadi pilih foto dengan area penting di tengah
- Backup foto original Anda di tempat lain

---

**Selamat!** 🎉 Aplikasi MyPorto Anda sekarang siap dengan foto profil yang dipersonalisasi!
