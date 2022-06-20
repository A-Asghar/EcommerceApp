import 'package:ecommerceapp/Screens/PaymentScreen.dart';
import 'package:ecommerceapp/Services/Providers/CartProvider.dart';
import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:ecommerceapp/Widgets/NavigateToHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/CartItems.dart';
import 'NavigationBar.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: const NavigateToHome(),
              title: const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            body: Center(
                child: Column(
              children: [
                Expanded(child: CartItems()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: Row(
                    children: [
                      MultiPurposeButton(
                          onPressed: () {
                            if (context.read<CartProvider>().cartList.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Cart is empty !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.tealAccent,
                              ));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  itemsInCart: context
                                      .watch<CartProvider>()
                                      .cartList
                                      .length,
                                  cartTotal:
                                      context.watch<CartProvider>().cartTotal,
                                ),
                              ));
                            }
                          },
                          buttonText: 'Checkout'),
                      Expanded(
                          child: ListTile(
                        title: const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '\$${context.watch<CartProvider>().cartTotal.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )),
          )),
    );
  }
}
