import 'dart:convert';
import 'package:ayurvedic_centre_patients/view/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> postUser(
    String username, String pass, BuildContext context) async {
  final shared = await SharedPreferences.getInstance();
  final url = Uri.parse('https://flutter-amr.noviindus.in/api/Login');

  final Map<String, String> formData = {
    'username': username,
    'password': pass,
  };
  final response = await http.post(
    url,
    body: formData,
  );

  if (response.statusCode == 200) {
    String access = jsonDecode(response.body)['token'];
    shared.setString('access', access);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
    print(access);
  }
}
