import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepo {
  final _auth = FirebaseAuth.instance;
  Future<void> login({required String email, required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wrong!';
    } catch (e) {
      throw e;
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String nama}) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await login(email: email, password: password);

      String userId = user.user!.uid;

      // await saveUserData(userId: userId, email: email, nama: nama);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wrong!';
    } catch (e) {
      throw e;
    }
  }

  // Future<void> saveUserData({
  //   required String userId,
  //   required String email,
  //   required String nama,
  // }) async {
  //   final url =
  //       'https://your-api-endpoint.com/save_user_data'; // Replace with your API endpoint
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'userId': userId,
  //       'email': email,
  //       'nama': nama,
  //     }),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to save user data');
  //   }
  // }
}
