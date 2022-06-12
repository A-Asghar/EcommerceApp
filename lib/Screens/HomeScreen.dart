import 'package:ecommerceapp/Widgets/CartIcon.dart';
import 'package:ecommerceapp/Widgets/CategoriesList.dart';
import 'package:ecommerceapp/Widgets/CouponTab.dart';
import 'package:ecommerceapp/Widgets/PopularProducts.dart';
import 'package:flutter/material.dart';

import '../Widgets/NotificationIcon.dart';
import '../Widgets/SearchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: ()async{
            return false;
          },
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SearchBar(),
                          CartIcon(),
                          NotificationIcon(),
                        ],
                      ),
                      CouponTab(),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Text(
                          'Categories',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      CategoriesList(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Popular Products',
                                style: TextStyle(fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                },
                                child: const Text(
                                  'See All  ',
                                  style: TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                              )
                            ],
                          )),
                      PopularProducts(),
                    ],
                  ),
                ),
              ),
            )
        ),
    );
  }
}
