import 'package:flutter/material.dart';

class SettingsScreenContainer extends StatelessWidget {
  const SettingsScreenContainer(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final icon;
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
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 22),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
