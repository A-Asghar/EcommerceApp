import 'package:ecommerceapp/Services/Providers/CartProvider.dart';
import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(
      {Key? key,
      required this.imgList,
      required this.productName,
      required this.productPrice,
      required this.productDescription,
      required this.productRating,
      required this.productReviews,
      required this.productImageUrl})
      : super(key: key);

  final List imgList;
  final List productReviews;
  final String productName;
  final double productPrice;
  final String productDescription;
  final int productRating;
  final String productImageUrl;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // final ReviewsList = [
  //   'I saw a video where someone posted about this product\'s quality and his experience with this headset.',
  //   'The sound is very good, clear and a package of best sound. But after very rare use in 3 months right speaker gets off. Then went to sony service, they instantly replaced it without hesitation.  But now i am editing after 1 year. Its left speaker again gets off. As 2 days ago warranty expired so I have not proposed to service center. But in a year needs replacement twice, so please think before purchasing.'
  // ];

  @override
  Widget build(BuildContext context) {
    final ReviewsList = widget.productReviews;
    String desc =
        'urBeats Earphones \n\nMade to take a beating.\n\nReplacing busted ear buds gets old fast. urBeats earphones were made to be an upgrade from the headphones that come with your music player: more durability, better sound, and a chance to do real justice to your music.\n\nurBeats headphones are made to be an upgrade from the white ear buds that come with your Apple device. More durability, better sound, and a chance to do real justice to your music. If you have an Apple device and demand excellent quality from an in-ear headphone, urBeats are designed for you.\n\nSolid metal housing.\n\nDr.Dre Beats Earphones\n\nPrecision‐machined single‐billet metal housing prevents vibrations and unwelcome sound from tainting your listening experience.';

    // List<Widget> imageSliders = widget.imgList
    //     .map((item) => Container(
    //           width: MediaQuery.of(context).size.width,
    //           alignment: Alignment.topLeft,
    //           child: FittedBox(
    //             fit: BoxFit.fill,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //               child: Container(
    //                 child: Align(
    //                   alignment: Alignment(-0.5, -0.2),
    //                   widthFactor: 1,
    //                   heightFactor: 1,
    //                   child: Image.network(
    //                     item,
    //                     fit: BoxFit.scaleDown,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ))
    //     .toList();

    List<Widget> imageSliders = widget.imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: 1000.0,
                        ),
                        // Positioned(
                        //   bottom: 0.0,
                        //   left: 0.0,
                        //   right: 0.0,
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       gradient: LinearGradient(
                        //         colors: [
                        //           Color.fromARGB(200, 0, 0, 0),
                        //           Color.fromARGB(0, 0, 0, 0)
                        //         ],
                        //         begin: Alignment.bottomCenter,
                        //         end: Alignment.topCenter,
                        //       ),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 20.0),
                        //   ),
                        // ),
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
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
      ),
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
                              widget.productName,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 25, left: 30, right: 50, bottom: 25),
                        //   child: SizedBox(
                        //     height: MediaQuery.of(context).size.height * 0.2,
                        //     width: MediaQuery.of(context).size.width * 0.85,
                        //     child: SingleChildScrollView(
                        //       child: Text(
                        //         'Product Description \n\n' + desc,
                        //         style: const TextStyle(
                        //             fontSize: 15,
                        //             color: Colors.grey,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 0, left: 30, right: 50, bottom: 25),
                        //   child: Container(
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: const [
                        //             Text(
                        //               'Rated 4.2',
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //             Icon(Icons.star, color: Colors.amber)
                        //           ],
                        //         ),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height * 0.15,
                        //           child: ListView.builder(
                        //               shrinkWrap: true,
                        //               itemCount: ReviewsList.length,
                        //               itemBuilder: (context, index) {
                        //                 return Card(
                        //                     margin: EdgeInsets.only(bottom: 15),
                        //                     child: Container(
                        //                         // height: 50,
                        //                         child: Text(
                        //                       ReviewsList[index],
                        //                       style: const TextStyle(
                        //                           color: Colors.black,
                        //                           fontSize: 15),
                        //                     )));
                        //               }),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),

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
                                desc: widget.productDescription ,
                              ),
                              ProductReviews(
                                Rating: widget.productRating,
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
                                  context.read<CartProvider>().addToCart(
                                      widget.productName,
                                      widget.productPrice,
                                      widget.productImageUrl);
                                },
                                buttonText: 'Add To Cart'),
                            Text(
                              '\$' + widget.productPrice.toString(),
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
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 30, right: 50, bottom: 25),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: SingleChildScrollView(
          child: Text(
            'Product Description \n\n' + desc,
            style: const TextStyle(
                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ProductReviews extends StatelessWidget {
  const ProductReviews(
      {Key? key, required this.ReviewsList, required this.Rating})
      : super(key: key);
  final ReviewsList;
  final int Rating;
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
                    'Rated ' + Rating.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Icon(Icons.star, color: Colors.amber)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ReviewsList.isEmpty
                  ? const Center(
                      child: Text(
                        'No Reviews Yet',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ReviewsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 8,
                            margin: EdgeInsets.only(bottom: 25),
                            child: Container(
                                // height: 50,
                                child: Text(
                              ReviewsList[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            )));
                      }),
            )
          ],
        ),
      ),
    );
  }
}
