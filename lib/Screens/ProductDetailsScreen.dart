import 'package:ecommerceapp/Services/Providers/CartProvider.dart';
import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:ecommerceapp/Widgets/NavigateToHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:provider/provider.dart';

import '../Services/ProductManagement/ProductModel.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({required this.product});
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ReviewsList = widget.product.productReviews;

    List<Widget> imageSliders = widget.product.imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item,
                          fit: BoxFit.scaleDown,
                          width: 1000.0,
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const NavigateToHome()),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: false,
                    height: MediaQuery.of(context).size.height * 0.3),
                items: imageSliders,
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        // color: Colors.grey,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        )),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 20, right: 20, bottom: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              widget.product.productName,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ContainedTabBarView(
                            tabs: const [
                              Text('Description'),
                              Text('Reviews'),
                            ],
                            tabBarProperties: TabBarProperties(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 8.0,
                              ),
                              indicator: ContainerTabIndicator(
                                radius: BorderRadius.circular(16.0),
                                color: Colors.blueGrey,
                                borderWidth: 0.0,
                                borderColor: Colors.black,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[400],
                            ),
                            views: [
                              ProductDescription(
                                desc: widget.product.productDescription,
                              ),
                              ProductReviews(
                                Rating: widget.product.productRating,
                                ReviewsList: ReviewsList,
                              )
                            ],
                            onChange: (index) => print(index),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MultiPurposeButton(
                                onPressed: () {
                                  CartProducts product = CartProducts(
                                      name: widget.product.productName,
                                      imageUrl: widget.product.productImageUrl,
                                      price: widget.product.productPrice,
                                      productID: widget.product.productID);
                                  context
                                      .read<CartProvider>()
                                      .addToCart(product);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Added To Cart !",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.tealAccent,
                                  ));
                                },
                                buttonText: 'Add To Cart'),
                            Text(
                              '\$' + widget.product.productPrice.toString(),
                              style: const TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, required this.desc}) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.fromLTRB(30, 25, 30, 25),
      child: Text(
        'Product Description \n\n' + desc,
        style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            height: 2),
      ),
    ));
  }
}

class ProductReviews extends StatelessWidget {
  const ProductReviews(
      {Key? key, required this.ReviewsList, required this.Rating})
      : super(key: key);
  final ReviewsList;
  final double Rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 30, right: 50, bottom: 25),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Rated ' + Rating.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Icon(Icons.star, color: Colors.amber)
                ],
              ),
            ),
            Expanded(
              child: ReviewsList.isEmpty
                  ? const Center(
                      child: Text(
                        'No Reviews Yet',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ReviewsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.only(bottom: 25),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                height: 50,
                                child: Text(
                                  ReviewsList[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.center,
                                )));
                      }),
            )
          ],
        ),
      ),
    );
  }
}
