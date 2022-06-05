import 'package:ecommerceapp/Services/UserManagement/GetUserDetails.dart';
import 'package:ecommerceapp/Widgets/userData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccountScreenContainer extends StatefulWidget {
  const MyAccountScreenContainer(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);
  final Future<String>? text;
  final VoidCallback? onPressed;
  final icon;

  @override
  State<MyAccountScreenContainer> createState() => _MyAccountScreenContainerState();
}

class _MyAccountScreenContainerState extends State<MyAccountScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: widget.onPressed,
        child: Row(
          children: [
            widget.icon,
            SizedBox(width: 20),
            Expanded(
                child: userData(
              future: widget.text,
            )),
            const Icon(
              Icons.edit,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
