import 'package:flutter/material.dart';
import 'package:untitled/features/products/model/products_response_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Products? products;
  const ProductDetailsPage({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: const [
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Add to Cart'),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: ListView(
        children: [
          // Product image
          Image.network(
            "${products?.thumbnail}",
            height: MediaQuery.of(context).size.height / 1.8,
            fit: BoxFit.fill,
          ),

          // Product title
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text(
              '${products?.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),

          // Product description
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                '${products?.description}'),
          ),

          // Product price
           Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '\$${products?.price}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}