import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/products/repository/product_repository.dart';
import 'package:untitled/features/products/view_model/products_view_model.dart';

import '../../products/view/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final productViewModel =
        Provider.of<ProductsViewModel>(context, listen: false);
    productViewModel.getAllProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductsViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: productViewModel.productsResponse?.products?.length,
          itemBuilder: (context, index) {
            final product = productViewModel.productsResponse?.products?[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(
                              products: product,
                            )));
              },
              child: Container(
                //width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x3600000F),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                "${product?.thumbnail}",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                              child: Text(
                                "${product?.title}",
                                style: TextStyle(fontSize: 12),overflow: TextOverflow.fade,maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                              child: Text(
                                '\$${product?.price}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
