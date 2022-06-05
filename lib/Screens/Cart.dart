import 'package:ecommerceapp/Services/Providers/CartProvider.dart';
import 'package:ecommerceapp/Widgets/CategoriesList.dart';
import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:provider/provider.dart';

import '../Widgets/CartItems.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {},
        ),
        title: Text(
          'Your Cart',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
      body: Center(
          child: Column(
            children: [
              Expanded(child: CartItems()),
              Container(
                // decoration: BoxDecoration(
                //     color: Colors.transparent,
                //     // border: Border.all(),
                //     borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20))),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width*0.99,
                child: Row(
                  children: [
                    MultiPurposeButton(onPressed: () {}, buttonText: 'Checkout'),
                    Expanded(
                        child: ListTile(
                          title: const Text(
                            'Total',
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    ));
  }
}
