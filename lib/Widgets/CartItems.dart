import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/Providers/CartProvider.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return context.watch<CartProvider>().cartList.isEmpty
        ? const Center(
            child: Text(
              'There are no items in your cart !',
              style: TextStyle(fontSize: 25),
            ),
          )
        : ListView.builder(
            itemCount: context.watch<CartProvider>().cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ClipRect(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Image(
                                image: NetworkImage(context
                                    .watch<CartProvider>()
                                    .cartList[index]
                                    .imageUrl),fit: BoxFit.fill,),
                          ),
                          Expanded(
                              child: ListTile(
                            title: Text(
                              context
                                  .watch<CartProvider>()
                                  .cartList[index]
                                  .name,
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: Text(
                              '\$${context.watch<CartProvider>().cartList[index].price.toString()}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
  }
}
