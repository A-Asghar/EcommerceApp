import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/NavigationBar.dart';
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
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  'There are no items in your cart !',
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ));
                    },
                    child: Text('Keep Shopping',style: TextStyle(fontSize: 22,color: Colors.white),))
                // MultiPurposeButton(onPressed: (){
                //   Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => NavBar(),
                //   ));
                // }, buttonText: 'Continue Shopping')
              ],
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Image(
                              image: NetworkImage(context
                                  .watch<CartProvider>()
                                  .cartList[index]
                                  .imageUrl),
                              fit: BoxFit.fill,
                            ),
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
                          )),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeFromCart(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
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
