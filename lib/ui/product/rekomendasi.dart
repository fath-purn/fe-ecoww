import 'package:flutter/material.dart';
import 'package:ecoww/ui/product/detail_product.dart';

class RekomendasiScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rekomendasiMenu = [
    {
      'id': '1',
      'gambar': 'assets/menu-educow.png',
      'nama': 'Produk 1',
      'deskripsi': 'Deskripsi singkat 1',
      'bintang': 4,
      'harga': 'Rp 50.000',
      'detail': 'Detail lengkap dari Produk 1.',
      'terjual': '5',
    },
    {
      'id': '2',
      'gambar': 'assets/menu-educow.png',
      'nama': 'Produk 2',
      'deskripsi': 'Deskripsi singkat 2',
      'bintang': 3,
      'harga': 'Rp 60.000',
      'detail': 'Detail lengkap dari Produk 2.',
      'terjual': '5',
    },
    {
      'id': '3',
      'gambar': 'assets/menu-educow.png',
      'nama': 'Produk 3',
      'deskripsi': 'Deskripsi singkat 3',
      'bintang': 5,
      'harga': 'Rp 70.000',
      'detail': 'Detail lengkap dari Produk 3.',
      'terjual': '5',
    },
    {
      'id': '4',
      'gambar': 'assets/menu-educow.png',
      'nama': 'Produk 4',
      'deskripsi': 'Deskripsi singkat 4',
      'bintang': 2,
      'harga': 'Rp 80.000',
      'detail': 'Detail lengkap dari Produk 4.',
      'terjual': '5',
    },
    {
      'id': '5',
      'gambar': 'assets/menu-educow.png',
      'nama': 'Produk 5',
      'deskripsi': 'Deskripsi singkat 5',
      'bintang': 4,
      'harga': 'Rp 90.000',
      'detail': 'Detail lengkap dari Produk 5.',
      'terjual': '5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 1, 30, 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                rekomendasiMenu.map((item) => ProductDetailCard(item)).toList(),
          ),
        ),
      ),
    );
  }
}

class ProductDetailCard extends StatelessWidget {
  final Map<String, dynamic> item;

  ProductDetailCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
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
          // Gambar
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(item['gambar']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          // Nama dan Deskripsi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama
                    Text(
                      item['nama'],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    // Deskripsi
                    Text(
                      item['deskripsi'],
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    // Bintang
                    Row(
                      children: [
                        for (int i = 0; i < item['bintang']; i++)
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        for (int i = 0; i < 5 - item['bintang']; i++)
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 20,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              // Harga dan Tombol Lihat Selengkapnya
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Harga
                  Text(
                    item['harga'],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Tombol Lihat Selengkapnya
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: item),
                        ),
                      );
                    },
                    child: Text('Lihat'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
