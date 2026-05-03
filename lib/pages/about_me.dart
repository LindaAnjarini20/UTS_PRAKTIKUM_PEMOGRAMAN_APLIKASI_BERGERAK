import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Saya',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.purple.shade300,
                  width: 6,
                ),
                color: Colors.purple.shade100,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/10.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // NPM
            const Text(
              'NPM',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '20241320058',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            // Nama
            const Text(
              'Nama',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Linda Anjarini',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            // Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Sekilas tentang saya adalah seorang mahasiswa yang sedang menempuh pendidikan di Universitas Kebangsaan Republik Indonesia. Saya memiliki minat yang besar dalam bidang teknologi dan pengembangan aplikasi. Saya selalu bersemangat untuk belajar hal-hal baru dan mengembangkan keterampilan saya di dunia pemrograman.  Saya percaya bahwa dengan kerja keras dan dedikasi, saya dapat mencapai tujuan saya dalam dunia teknologi. Saya juga senang berkolaborasi dengan orang lain dan berbagi pengetahuan untuk menciptakan solusi yang inovatif.   Saya berharap dapat terus tumbuh dan berkembang dalam karier saya di bidang teknologi, serta memberikan kontribusi positif bagi masyarakat melalui karya-karya saya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
