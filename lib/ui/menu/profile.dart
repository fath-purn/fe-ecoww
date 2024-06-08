import 'package:ecoww/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff497748),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/menu-educow.png'),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: MediaQuery.of(context).size.width / 2 + 30,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Implement edit profile action
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Sandra Fu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Banyumas',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              subtitle: Text('Lorem ipsum'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to settings
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Alamat Lengkap'),
              subtitle: Text('Lorem ipsum'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to address
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Pusat Bantuan'),
              subtitle: Text('Lorem ipsum'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to help center
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () async {
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false));
                },
                child: Text('Keluar'),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
