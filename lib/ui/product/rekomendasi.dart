import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoww/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:ecoww/ui/product/detail_product.dart';

class RekomendasiScreen extends StatelessWidget {
  // final List<Map<String, dynamic>> rekomendasiMenu = [
  //   {
  //     'id': '1',
  //     'gambar': 'assets/menu-educow.png',
  //     'nama': 'Produk 1',
  //     'deskripsi': 'Deskripsi singkat 1',
  //     'bintang': 4,
  //     'harga': 'Rp 50.000',
  //     'detail': 'Detail lengkap dari Produk 1.',
  //     'terjual': '5',
  //   },
  //   {
  //     'id': '2',
  //     'gambar': 'assets/menu-educow.png',
  //     'nama': 'Produk 2',
  //     'deskripsi': 'Deskripsi singkat 2',
  //     'bintang': 3,
  //     'harga': 'Rp 60.000',
  //     'detail': 'Detail lengkap dari Produk 2.',
  //     'terjual': '5',
  //   },
  //   {
  //     'id': '3',
  //     'gambar': 'assets/menu-educow.png',
  //     'nama': 'Produk 3',
  //     'deskripsi': 'Deskripsi singkat 3',
  //     'bintang': 5,
  //     'harga': 'Rp 70.000',
  //     'detail': 'Detail lengkap dari Produk 3.',
  //     'terjual': '5',
  //   },
  //   {
  //     'id': '4',
  //     'gambar': 'assets/menu-educow.png',
  //     'nama': 'Produk 4',
  //     'deskripsi': 'Deskripsi singkat 4',
  //     'bintang': 2,
  //     'harga': 'Rp 80.000',
  //     'detail': 'Detail lengkap dari Produk 4.',
  //     'terjual': '5',
  //   },
  //   {
  //     'id': '5',
  //     'gambar': 'assets/menu-educow.png',
  //     'nama': 'Produk 5',
  //     'deskripsi': 'Deskripsi singkat 5',
  //     'bintang': 4,
  //     'harga': 'Rp 90.000',
  //     'detail': 'Detail lengkap dari Produk 5.',
  //     'terjual': '5',
  //   },
  // ];

  const RekomendasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Rekomendasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff497748),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 1, 30, 30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('produk').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductDetailCard({
                  'id': documents[index].id,
                  'gambar': documents[index]['gambar'],
                  'nama': documents[index]['nama'],
                  'deskripsi': documents[index]['deskripsi'],
                  'rating': documents[index]['rating'],
                  'harga': documents[index]['harga'],
                  'detail': documents[index]['detail'],
                  'terjual': documents[index]['terjual'],
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetailCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff497748),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
                image: NetworkImage(item['gambar']),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16.0),
          // Nama dan Deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
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
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      // Deskripsi
                      Text(
                        item['deskripsi'],
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      // Bintang
                      Row(
                        children: [
                          for (int i = 0; i < item['rating']; i++)
                            const Icon(
                              Icons.star,
                              color: Color(0xffFFC700),
                              size: 20,
                            ),
                          for (int i = 0; i < 5 - item['rating']; i++)
                            const Icon(
                              Icons.star_border,
                              color: Color(0xffFFC700),
                              size: 20,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                // Harga dan Tombol Lihat Selengkapnya
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Harga
                    Text(
                      formatCurrency(item['harga'].toDouble()),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Tombol Lihat Selengkapnya
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff497748),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(item: item),
                          ),
                        );
                      },
                      child: const Text(
                        'Lihat',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
