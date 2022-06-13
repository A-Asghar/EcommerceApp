import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Screens/ProductDetailsScreen.dart';
import '../Services/ProductManagement/ProductModel.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.stream}) : super(key: key);
  final stream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data.size > 0) {
            return SingleChildScrollView(
              child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(
                    snapshot.data.docs.length,
                    (index) {
                      var product = snapshot.data.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: Product(
                                productID: product['productID'],
                                imgList: snapshot
                                    .data.docs[index]['productImageList']
                                    .toList(),
                                productName: product['productName'],
                                productPrice: product['productPrice'],
                                productDescription:
                                    product['productDescription'],
                                productRating:
                                    product['productRating'].toDouble(),
                                productReviews: snapshot
                                    .data.docs[index]['productReviews']
                                    .toList(),
                                productImageUrl: product['productImageUrl'],
                              ),
                            ),
                          ));
                        },
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Image(
                                image: NetworkImage(product['productImageUrl']),
                                fit: BoxFit.contain,
                              ),
                            )),
                            Text(product['productName']),
                            Text('\$' +
                                product['productPrice'].toStringAsFixed(2))
                          ],
                        ),
                      );
                    },
                  )),
            );
          }
          return const Center(
            child: Text('No Products !'),
          );
        });
  }
}
