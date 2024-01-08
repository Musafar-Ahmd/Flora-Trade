import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/products/repository/product_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: TextButton(onPressed: () {
        ProductRepository().listProducts(context);
      }, child: Text("data")),
    ),
  );
  }
}