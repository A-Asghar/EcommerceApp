import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProducts> _cartList = [];
  double _cartTotal = 0.0;

  List<CartProducts> get cartList => _cartList;
  double get cartTotal => _cartTotal;

  // addToCart(name, price, imageUrl) {
  //   _cartTotal += price;
  //   _cartList.add(CartProducts(name: name, price: price, imageUrl: imageUrl));
  //   notifyListeners();
  // }

  addToCart(CartProducts product) {
    _cartTotal += product.price;
    CartProducts p;
    bool alreadyExistsInCart = false;
    for (p in _cartList) {
      if (p.productID == product.productID) {
        alreadyExistsInCart = true;
      }
    }
    if (alreadyExistsInCart) {
      _cartList
          .firstWhere((element) => element.productID == product.productID)
          .qty += 1;
    } else {
      _cartList.add(CartProducts(
          name: product.name,
          price: product.price,
          imageUrl: product.imageUrl,
          qty: 1,
          productID: product.productID));
    }
    notifyListeners();
  }

  increaseQuantity(CartProducts product) {
    CartProducts cartProduct = _cartList
        .firstWhere((element) => element.productID == product.productID);
    cartProduct.qty += 1;
    _cartTotal += product.price;
    notifyListeners();
  }

  decreaseQuantity(CartProducts product) {
    CartProducts cartProduct = _cartList
        .firstWhere((element) => element.productID == product.productID);
    cartProduct.qty -= 1;
    _cartTotal -= product.price;
    if (cartProduct.qty == 0) {
      _cartList.remove(cartProduct);
    }
    notifyListeners();
  }

  removeFromCart(index) {
    _cartTotal -= _cartList[index].price * _cartList[index].qty;
    if (_cartTotal < 0) {
      _cartTotal = 0;
    }
    _cartList.removeAt(index);
    notifyListeners();
  }
}

class CartProducts {
  String name;
  double price;
  String imageUrl;
  int qty;
  String productID;
  CartProducts(
      {required this.name,
      required this.price,
      required this.imageUrl,
      this.qty = 0,
      required this.productID});
}
