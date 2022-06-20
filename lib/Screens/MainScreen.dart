import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'LoginScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(
                  'https://i.ibb.co/RcV35gs/Untitled-design-2.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.network(
                    'https://i.ibb.co/QDj8cCT/image-removebg-preview-6.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Image(
                    image: AssetImage('assets/mainScreenImage.jpg')),
              ),
              Align(
                child: MultiPurposeButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  buttonText: 'Continue',
                ),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      ),
    );
  }
}
