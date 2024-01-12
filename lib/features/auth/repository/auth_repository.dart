import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';

class AuthRepository {
  Future login(Login login, BuildContext context) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(login.toJson()),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Email or Password is incorrect'),
      //   ),
      // );
      print("dara");
    }
  }

  //TODO
  Future register() async {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"username": "mor_2314", "password": "83r5^_"}),
    );
    print({response.statusCode});
    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }
}
