// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoww/ui/product/detail_product.dart';
import 'package:ecoww/ui/product/rekomendasi.dart';
import 'package:ecoww/ui/review/review.dart';

class ProductAllScreen extends StatefulWidget {
  @override
  _ProductAllScreenState createState() => _ProductAllScreenState();
}

class _ProductAllScreenState extends State<ProductAllScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Navigator.pushNamed(context, '/RekomendasiScreen');
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product',
          style: TextStyle(
            color: Color(0xff497748),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(0, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildMenuOption(
                          onTap: () {
                            // Navigator.pushNamed(context, '/ProductAllScreen');
                          },
                          iconPath: 'assets/product-makanan.png',
                          label: 'Makanan',
                        ),
                        buildMenuOption(
                          onTap: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          iconPath: 'assets/product-minuman.png',
                          label: 'Minuman',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rekomendasi Menu',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          buildRekomendasiMenu(),
                          SizedBox(height: 16.0),
                          Text(
                            'Rekomendasi Menu',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SlideCardDemo(),
                          SizedBox(height: 16.0),
                          Text(
                            'Review Pelanggan',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: buildReviewPelanggan(index: 0),
                          //     ),
                          //     Expanded(
                          //       child: buildReviewPelanggan(index: 1),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 10.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewScreen(
                                      item: reviewPelanggan[0],
                                      allReview: true,
                                    ),
                                  ),
                                );
                              },
                              child: Text('Lihat Selengkapnya'),
                            ),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuOption({
    required VoidCallback onTap,
    required String iconPath,
    required String label,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Color(0xFF449977),
                  width: 2.0,
                )),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(iconPath),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRekomendasiMenu() {
    return Container(
      height: 160.0,
      child: ListView.builder(
        clipBehavior: Clip.none,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: rekomendasiMenu.length + 1, // Tambah 1 untuk card terakhir
        itemBuilder: (context, index) {
          if (index == rekomendasiMenu.length) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RekomendasiScreen(),
                  ),
                );
              },
              child: Container(
                width: 150.0,
                margin: EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    SizedBox(height: 8.0),
                    Text(
                      'Lihat Selengkapnya',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0), // Mengatur radius Container
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor:
                      Colors.transparent, // Hilangkan bayangan default tombol
                  padding: EdgeInsets.zero, // Hilangkan padding default tombol
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Radius pada tombol
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(item: rekomendasiMenu[index]),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(8.0), // Radius pada gambar
                        child: Image.asset(
                          rekomendasiMenu[index]['gambar']!,
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        rekomendasiMenu[index]['nama']!,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        rekomendasiMenu[index]['harga']!,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildReviewPelanggan({required int index}) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
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
                backgroundImage:
                    AssetImage(reviewPelanggan[index]['profileImage']!),
                radius: 20.0,
              ),
              SizedBox(width: 10.0),
              Text(
                _truncateText(reviewPelanggan[index]['name']!),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            reviewPelanggan[index]['review']!,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideCardDemo extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/menu-product.png',
    // 'assets/menu-heacow.png',
    'assets/menu-educow.png',
  ];

  final List<String> titles = [
    'Product',
    // 'HeaCow',
    'EduCow',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: true,
        ),
        items: imagePaths.asMap().entries.map((entry) {
          int index = entry.key;
          String imagePath = entry.value;
          return Builder(
            builder: (BuildContext context) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7, 7, 30, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: SizedBox(
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

String _truncateText(String text) {
  if (text.length <= 5) {
    return text;
  } else {
    return text.substring(0, 5) + '...';
  }
}
