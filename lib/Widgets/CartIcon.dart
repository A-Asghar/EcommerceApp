import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.1),
          borderRadius: BorderRadius.circular(
            20
          )),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.15,
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
        size: MediaQuery.of(context).size.height * 0.05,
      ),
    );
  }
}
