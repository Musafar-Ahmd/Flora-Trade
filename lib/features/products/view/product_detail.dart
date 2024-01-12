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

// class DetailScreen extends StatefulWidget {
//   final Item item;
//
//   DetailScreen({this.item});
//
//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     SizeConfig().init(context);
//
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: _detailBody(item),
//       bottomNavigationBar: _buildNavigationBar(cart, context),
//     );
//   }
//
//   SingleChildScrollView _detailBody(Item item) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: SizeConfig.blockSizeVertical * 1,
//           ),
//           _topImage(item),
//           SizedBox(
//             height: SizeConfig.blockSizeVertical * 1,
//           ),
//           _titleAndContent(item),
//           if (item.rating != null) _latestRating(item),
//           _priceAndSpecialPrice(item),
//           _colorSpecifics(),
//           _storageSpecifics(),
//           _aboutProducts(),
//           _similarProducts(),
//           SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }

//   SizedBox _latestRating(Item item) {
//     return SizedBox(
//       child: Container(
//         margin: EdgeInsets.only(
//           left: 8.0,
//           bottom: 8.0,
//         ),
//         height: SizeConfig.blockSizeVertical * 2,
//         width: SizeConfig.blockSizeHorizontal * 10,
//         decoration: BoxDecoration(
//           color: Colors.amber[500],
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         child: Center(
//           child: Text(
//             '⭐${item.rating}',
//             style: TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   FutureBuilder<Attrs> _storageSpecifics() {
//     return FutureBuilder(
//         future: _attrs,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             final attrs = snapshot.data;
//             if (attrs.specs.length > 0)
//               return Container(
//                 margin: EdgeInsets.all(8.0),
//                 height: SizeConfig.blockSizeVertical * 10,
//                 width: SizeConfig.blockSizeVertical * 10,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         CachedNetworkImage(
//                           width: SizeConfig.blockSizeHorizontal * 8,
//                           height: SizeConfig.blockSizeVertical * 5,
//                           imageUrl: attrs.specs[0].icon,
//                           fit: BoxFit.cover,
//                         ),
//                         Text('${attrs.specs[0].value}'),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//           } else {
//             return SizedBox();
//           }
//           return SizedBox();
//         });
//   }
//
//   Card _similarProducts() {
//     return Card(
//       child: Container(
//         width: double.infinity,
//         height: SizeConfig.blockSizeVertical * 33,
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Similar Products',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             FutureBuilder<List<sim.Item>>(
//                 future: _similarItems,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasData) {
//                       if (snapshot.data.length > 0) {
//                         return Expanded(
//                           child: GridView.builder(
//                               shrinkWrap: true,
//                               primary: false,
//                               itemCount: snapshot.data.length,
//                               gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2),
//                               itemBuilder: (context, index) {
//                                 return SimilarGridItem(
//                                     item: snapshot.data[index]);
//                               }),
//                         );
//                       } else {
//                         return Center(child: Text('No \n similar \n products'));
//                       }
//                     } else {
//                       return Center(child: Text('No \n similar \n products'));
//                     }
//                   } else {
//                     return Center(
//                       child: Text('No similar products'),
//                     );
//                   }
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Card _aboutProducts() {
//     return Card(
//       child: Container(
//         height: SizeConfig.blockSizeVertical * 12,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'About Products',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 'View  details...',
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   FutureBuilder<Attrs> _colorSpecifics() {
//     return FutureBuilder(
//         future: _attrs,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final attrs = snapshot.data;
//
//             //  print(attrs.specs[0].icon);
//             final color = attrs.color;
//
//             if (color.length >= 4) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 35,
//                   child: Container(
//                     color: Colors.grey[400],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           'color',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blueGrey),
//                         ),
//                         SizedBox(width: 20),
//                         CachedNetworkImage(imageUrl: color),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//
//             return SizedBox();
//           } else {
//             return SizedBox();
//           }
//         });
//   }
//
//   Padding _priceAndSpecialPrice(Item item) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Row(
//         children: [
//           if (item.specialPrice != null)
//             Row(
//               children: [
//                 Text('OMR ${item.specialPrice.roundToDouble()}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     )),
//                 SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//           Text(
//             'OMR ${item.price.roundToDouble()}',
//             style: TextStyle(
//               color: item.specialPrice == null ? Colors.red : Colors.grey,
//               decoration: item.specialPrice != null
//                   ? TextDecoration.lineThrough
//                   : TextDecoration.none,
//               fontWeight: item.specialPrice != null
//                   ? FontWeight.normal
//                   : FontWeight.bold,
//               //color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _titleAndContent(Item item) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Text(
//         item.name,
//         textAlign: TextAlign.left,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Stack _topImage(Item item) {
//     return Stack(children: [
//       Container(
//         width: double.infinity,
//         height: SizeConfig.blockSizeVertical * 30,
//         child: CachedNetworkImage(imageUrl: '${URLS.MEDIA_URL}${item.image}'),
//       ),
//       Positioned(
//         top: 10,
//         right: 10,
//         child: Heart(),
//       ),
//     ]);
//   }
//
//   Container _buildNavigationBar(CartProvider cart, BuildContext context) {
//     return Container(
//       height: kToolbarHeight,
//       width: double.infinity,
//       child: Row(
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 if (cart.cartItems.containsKey(widget.item.id)) {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) {
//                     return CartScreen();
//                   }));
//                 } else {
//                   cart.addToCart(
//                     widget.item.id.toString(),
//                     widget.item.name,
//                     1,
//                     widget.item.price,
//                     widget.item.image,
//                   );
//                   setState(() {});
//                 }
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 color: Colors.red,
//                 child: cart.cartItems.containsKey(widget.item.id)
//                     ? Text(
//                   'GO TO CART',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 )
//                     : Text(
//                   'ADD TO CART',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   AppBar _buildAppBar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       title: Text('Item Details'),
//       actions: [
//         Consumer<CartProvider>(
//           builder: (_, cartprovider, ch) => Badge(
//             child: ch,
//             value: cartprovider.itemCount.toString(),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) {
//                   return CartScreen();
//                 }),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }