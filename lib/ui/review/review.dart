import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool allReview;

  ReviewScreen({super.key, required this.item, required this.allReview});

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
        title: Text(allReview ? 'Review' : 'Review ' + item['nama']),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Review Pelanggan',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReviewDialog();
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: reviewPelanggan
                    .map((review) => buildReviewPelanggan(review))
                    .toList(),
              ),
            ],
          ),
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
                  review['name']!,
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
}

class ReviewDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambah Review'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama harus diisi';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _reviewController,
              decoration: InputDecoration(labelText: 'Review'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Review harus diisi';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Lakukan sesuatu dengan data yang diinput
              print('Nama: ${_nameController.text}');
              print('Review: ${_reviewController.text}');
              Navigator.of(context).pop();
            }
          },
          child: Text('Tambah'),
        ),
      ],
    );
  }
}
