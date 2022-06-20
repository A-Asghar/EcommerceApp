import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Screens/ProductDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../Services/ProductManagement/ProductModel.dart';
import 'ProductsList.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference Products =
        FirebaseFirestore.instance.collection('EcommerceAppProducts');
    return StreamBuilder(
        stream: Products.orderBy('productSales', descending: true).snapshots(),
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.35,
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: List.generate(
                      snapshot.data.docs.length,
                      (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                product: Product(
                                  productID: snapshot.data.docs[index]
                                      ['productID'],
                                  imgList: snapshot
                                      .data.docs[index]['productImageList']
                                      .toList(),
                                  productName: snapshot.data.docs[index]
                                      ['productName'],
                                  productPrice: snapshot.data.docs[index]
                                      ['productPrice'],
                                  productDescription: snapshot.data.docs[index]
                                      ['productDescription'],
                                  productRating: snapshot
                                      .data.docs[index]['productRating']
                                      .toDouble(),
                                  productReviews: snapshot
                                      .data.docs[index]['productReviews']
                                      .toList(),
                                  productImageUrl: snapshot.data.docs[index]
                                      ['productImageUrl'],
                                ),
                              ),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data.docs[index]
                                      ['productImageUrl']),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            );
          }
          return const Center(
            child: Text('No Products !'),
          );
        });
  }
}
