import 'package:flutter/material.dart';
import 'package:untitled/features/products/model/products_response_model.dart';

import '../repository/product_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  bool isLoading = false;
  ProductsResponse? productsResponse;
  // List<ProductsResponse>
  ProductRepository _productRepository = ProductRepository();

  getAllProducts(BuildContext context) async {
    await _productRepository.listProducts(context).then((value) {
      productsResponse = value;
    });
    notifyListeners();
  }
}
