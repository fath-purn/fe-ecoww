import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff4F8C4D),
        child: SingleChildScrollView(
          // Tambahkan SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 30.0),
                  buildMenuOption(
                    onTap: () {
                      Navigator.pushNamed(context, '/menu');
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
                      "Hello, Sandra",
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
                            Navigator.pushNamed(context, '/menu');
                          },
                          iconPath: 'assets/menu-product.png',
                          label: 'Product',
                          profile: false,
                        ),
                        buildMenuOption(
                          onTap: () {
                            Navigator.pushNamed(context, '/menu');
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
                    SlideCardDemoTop(),
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
              SizedBox(
                  height:
                      30), // Tambahkan jarak agar tombol tidak mepet ke bawah
              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       await GoogleSignIn().signOut();
              //       await FirebaseAuth.instance.signOut();
              //       Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(builder: (context) => LoginScreen()),
              //         (route) => false,
              //       );
              //     },
              //     child: const Text('Keluar'),
              //   ),
              // ),
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
}

class SlideCardDemoTop extends StatelessWidget {
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
                    Column(
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
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
