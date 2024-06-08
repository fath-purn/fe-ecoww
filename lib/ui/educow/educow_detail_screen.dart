import 'package:flutter/material.dart';

class EducowDetailScreen extends StatefulWidget {
  const EducowDetailScreen({super.key});

  @override
  State<EducowDetailScreen> createState() => _EducowDetailScreenState();
}

class _EducowDetailScreenState extends State<EducowDetailScreen> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Color(0xff497748),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoved = !isLoved;
                });
              },
              child: Image.asset(
                isLoved ? 'assets/love.png' : 'assets/heart.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/picture.png',
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Manfaat Susu Sapi Perah untuk Kesehatan Anda',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/gallery.png'),
                      SizedBox(width: 5),
                      Text('10 Dokumentasi'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Susu sapi perah merupakan sumber nutrisi yang kaya akan protein, kalsium, dan vitamin. Konsumsi susu sapi perah secara teratur dapat membantu memenuhi kebutuhan gizi harian Anda:',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '• Protein: Susu sapi perah mengandung protein berkualitas tinggi yang penting untuk pertumbuhan dan perbaikan jaringan tubuh.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '• Kalsium: Kalsium dalam susu sapi perah membantu menjaga kepadatan tulang dan gigi, serta menjaga kesehatan jantung dan otot.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '• Vitamin: Susu sapi perah mengandung berbagai jenis vitamin, termasuk vitamin A, D, dan B12, yang penting untuk kesehatan mata, tulang, dan sistem saraf.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'Selain protein, kalsium, dan vitamin, susu sapi perah juga mengandung zat besi yang penting untuk pembentukan sel darah merah. Namun, pastikan untuk memilih susu yang tidak mengandung tambahan gula atau bahan kimia yang tidak perlu.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
