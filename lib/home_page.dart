import 'package:flutter/material.dart';
import 'package:ecoww/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(
                      data: "Data terkirim dari home page",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
              ),
              child: const Text(
                'Menuju halaman kedua',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            // Tombol Kedua
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second_page',
                  arguments: 'Menggunakan route',
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0)),
              child: const Text(
                'Menuju halaman kedua dengan route',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
