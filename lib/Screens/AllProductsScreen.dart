import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Widgets/NavigateToHome.dart';
import 'package:ecommerceapp/Widgets/ProductsList.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'All Products',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        leading: NavigateToHome(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ProductsList(
        stream: FirebaseFirestore.instance
            .collection('EcommerceAppProducts')
            .snapshots(),
      ),
    ));
  }
}
