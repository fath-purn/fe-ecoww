import 'package:flutter/material.dart';
import 'package:ecoww/ui/review/review.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  final List<Map<String, String>> reviewPelanggan = [
    {
      'profileImage': 'assets/profile1.png',
      'name': 'Pelanggan 1',
      'review':
          'Ini adalah ulasan dari Pelanggan 1. Produk ini sangat bagus dan saya sangat puas!',
    },
    {
      'profileImage': 'assets/profile2.png',
      'name': 'Pelanggan 2',
      'review':
          'Ini adalah ulasan dari Pelanggan 2. Layanan yang diberikan sangat memuaskan!',
    },
  ];

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['nama']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(item['gambar']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['nama'],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      // Bintang
                      Row(
                        children: [
                          for (int i = 0; i < item['bintang']; i++)
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 24,
                            ),
                          for (int i = 0; i < 5 - item['bintang']; i++)
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                              size: 24,
                            ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        item['terjual'] + ' pcs terjual',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Harga
                Text(
                  '${item['harga']}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0),
            // Deskripsi
            Text(
              item['detail']!,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement your onPressed functionality here
                },
                child: Text('Beli Sekarang'),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kata Pelanggan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              child: Column(
                children: [
                  Column(
                    children: reviewPelanggan
                        .map((review) => buildReviewPelanggan(review))
                        .toList(),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewScreen(
                              item: item,
                              allReview: false,
                            ),
                          ),
                        );
                      },
                      child: Text('Lihat Selengkapnya'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReviewPelanggan(Map<String, String> review) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(review['profileImage']!),
                radius: 20.0,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  _truncateText(review['name']!),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            review['review']!,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _truncateText(String text) {
    if (text.length <= 30) {
      return text;
    } else {
      return text.substring(0, 30) + '...';
    }
  }
}
