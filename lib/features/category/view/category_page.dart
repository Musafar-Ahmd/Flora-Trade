import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/category/repository/category_repository.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          // CategoryRepository().getCategory(context);
        }, child: Text("data")),
      ),
    )
    ;
  }

}