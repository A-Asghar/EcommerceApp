import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Widgets/NavigateToHome.dart';
import 'package:ecommerceapp/Widgets/ProductsList.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              categoryName,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            leading: const NavigateToHome(),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: ProductsList(
            stream: FirebaseFirestore.instance
                .collection('EcommerceAppProducts')
                .where('productCategory', isEqualTo: categoryName)
                .snapshots(),
          ),
        ));
  }
}
