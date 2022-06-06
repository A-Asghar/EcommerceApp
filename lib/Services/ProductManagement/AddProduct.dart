import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct {
  CollectionReference Products =
      FirebaseFirestore.instance.collection('EcommerceAppProducts');
  addNewProduct(productName, productCategory, productPrice, productDescription,
      productStoreName, productImageUrl, productImageList) {
    List<String> productReviews = [];
    Products.add({
      'productName': productName,
      'productCategory': productCategory,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'productStoreName': productStoreName,
      'productImageUrl': productImageUrl,
      'productImageList': productImageList,
      'productRating': 0,
      'productSales': 0,
      'productReviews': productReviews
    });
  }
}
