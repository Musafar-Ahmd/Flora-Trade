import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../products/model/products_response_model.dart';

class CategoryRepository {
  Future getCategory(BuildContext context) async {
    var url = Uri.parse("https://dummyjson.com/products/categories");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
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
