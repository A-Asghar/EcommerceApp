import 'package:flutter/material.dart';

class CouponTab extends StatelessWidget {
  const CouponTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.ibb.co/7CkGxsn/laura-landers-ne7g-H470bx4-unsplash.jpg'),
                fit: BoxFit.fill,opacity: 0.7),
            // color: Colors.purple,
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Discount Coupon!',
            style: TextStyle(
                color: Colors.black, fontSize: 30),
          ),
        ));
  }
}
