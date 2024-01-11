import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/auth/view/login_page.dart';
import 'package:untitled/features/auth/view_model/auth_view_model.dart';
import 'package:untitled/features/products/view_model/products_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ProductsViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}