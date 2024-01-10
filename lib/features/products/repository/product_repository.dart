import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/products_response_model.dart';


class ProductRepository {
  Future<ProductsResponse?> listProducts(BuildContext context) async {
    var url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.toString());
    print("${response.body}");
    if (response.statusCode == 200) {
      print("${response.statusCode}");
      return ProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Loading Products'),
        ),
      );
    }
  }
}