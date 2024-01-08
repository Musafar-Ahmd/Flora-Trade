import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/products_response_model.dart';

class ProductRepository {
  Future listProducts(
      BuildContext context) async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.toString());
    print("${response.statusCode}");
    if (response.statusCode == 200) {
      print("${response.statusCode}");
      return ProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email or Password is incorrect'),
        ),
      );
    }
  }
}
