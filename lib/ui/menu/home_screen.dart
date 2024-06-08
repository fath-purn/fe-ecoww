// ignore_for_file: prefer_const_constructors

import 'package:ecoww/ui/educow/educow_screen.dart';
import 'package:ecoww/ui/menu/profile.dart';
import 'package:ecoww/ui/product/product_all.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoww/ui/product/detail_product.dart';
import 'package:ecoww/ui/product/rekomendasi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff4F8C4D),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 30.0),
                  buildMenuOption(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    iconPath: 'assets/menu-product.png',
                    label: 'Product',
                    profile: true,
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xffD6EBD8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff4F8C4D),
                          ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Color(0xff4F8C4D)),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Color(0xffD6EBD8),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(70.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Sandra!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Yuk! jelajahi E-Cow untuk pengalaman yang memukau",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildMenuOption(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductAllScreen(),
                              ),
                            );
                          },
                          iconPath: 'assets/menu-product.png',
                          label: 'Product',
                          profile: false,
                        ),
                        buildMenuOption(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EducowScreen(),
                              ),
                            );
                          },
                          iconPath: 'assets/menu-educow.png',
                          label: 'EduCow',
                          profile: false,
                        ),
                        buildMenuOption(
                          onTap: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          iconPath: 'assets/menu-heacow.png',
                          label: 'HeaCow',
                          profile: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Rekomendasi Menu",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    buildRekomendasiMenu(),
                    SizedBox(height: 30.0),
                    Text(
                      "Yuk, Perluas Pengatahuan Kamu!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SlideCardDemo(),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
    required bool profile,
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
              border: !profile
                  ? Border.all(
                      color: Colors.white,
                      width: 2.0,
                    )
                  : null,
            ),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(iconPath),
            ),
          ),
          SizedBox(height: 8.0),
          if (!profile)
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
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('product')
            .orderBy('timestamp')
            .snapshots(),
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: documents.length + 1, // Tambah 1 untuk card terakhir
            itemBuilder: (context, index) {
              if (index == documents.length) {
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
                Map<String, dynamic> data =
                    documents[index].data() as Map<String, dynamic>;

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
                      shadowColor: Colors
                          .transparent, // Hilangkan bayangan default tombol
                      padding:
                          EdgeInsets.zero, // Hilangkan padding default tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Radius pada tombol
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: data),
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
                            borderRadius: BorderRadius.circular(
                                8.0), // Radius pada gambar
                            child: Image.network(
                              data['gambar'],
                              width: 150.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            data['nama'],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            data['harga'],
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
          );
        },
      ),
    );
  }
}

class SlideCardDemo extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/menu-product.png',
    'assets/menu-heacow.png',
    'assets/menu-educow.png',
  ];

  final List<String> titles = [
    'Product',
    'HeaCow',
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
                        height: double.infinity, // Ensure image covers the card
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        child: SizedBox(
                          width: double
                              .infinity, // Ensure the text takes full width
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
