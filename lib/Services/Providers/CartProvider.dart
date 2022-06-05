import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProducts> _cartList = [];
  double _cartTotal = 0.0;

  List<CartProducts> get cartList => _cartList;
  double get cartTotal => _cartTotal;

  addToCart(name, price, imageUrl) {
    _cartList.add(CartProducts(name: name, price: price, imageUrl: imageUrl));
    notifyListeners();
  }

  calculateCartTotal(price) {
    _cartTotal += price;
    notifyListeners();
  }
}

class CartProducts {
  String name;
  double price;
  String imageUrl;
  CartProducts(
      {required this.name, required this.price, required this.imageUrl});
}
