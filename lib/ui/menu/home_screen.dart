// ignore_for_file: prefer_const_constructors

import 'package:ecoww/ui/educow/educow_screen.dart';
import 'package:ecoww/ui/menu/profile.dart';
import 'package:ecoww/ui/product/product_all.dart';
import 'package:ecoww/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoww/ui/product/detail_product.dart';
import 'package:ecoww/ui/product/rekomendasi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

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
                    SlideCardDemo(),
                  ],
                ),
              ),
              // SizedBox(height: 30),
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
    return SizedBox(
      height: 160.0,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('produk').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            clipBehavior: Clip.none,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: documents.length + 1, // Add 1 for the last card
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
                      children: const [
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
                        BorderRadius.circular(8.0), // Container radius
                    color: Color(0xff497748).withOpacity(0.41),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: data),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10.0), // Image radius
                          child: Image.network(
                            data['gambar'],
                            width: 150.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            data['nama'],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            formatCurrency(data['harga'].toDouble()),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
  const SlideCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('pengetahuan').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: documents.length,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> data =
                documents[index].data() as Map<String, dynamic>;
            List<String> images = List<String>.from(data['image']);
            List<String> titles = List<String>.from(data['title']);
            return SizedBox(
              height: 200, // Adjust the height as needed
              child: CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder:
                    (BuildContext context, int imageIndex, int pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[imageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: Text(
                              titles[imageIndex],
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: const <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
