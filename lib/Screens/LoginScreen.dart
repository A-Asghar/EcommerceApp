import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:ecommerceapp/Widgets/UserInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/SigninErrorDialog.dart';
import 'Cart.dart';
import 'HomeScreen.dart';
import 'NavigationBar.dart';
import 'Settings.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.grey,
              size: 25,
            ),
          ),
          title: const Text(
            'Login',
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: const Text(
                  'Sign in using your email ID and password',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: const Image(
                    image: NetworkImage(
                        'https://i.ibb.co/rckS5r5/339239-PB17-P3-369-min-removebg-preview.png')),
              ),
              userInput('Email', TextInputType.emailAddress, _email, false, 50),
              userInput('Password', TextInputType.visiblePassword, _password,
                  true, 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ));
                },
                child: const Text('Don\'t have an account yet? Signup!'),
              ),
              MultiPurposeButton(
                  onPressed: () {
                    // FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //         email: _email.text, password: _password.text)
                    //     .then((signedInUser) {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => NavBar(),
                    //   ));
                    // }).catchError((e) {
                    //   signinErrorDialog(e.code, context);
                    // });
                    Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NavBar(),
                          ));
                  },
                  buttonText: 'Login')
            ],
          ),
        )),
      ),
    );
  }
}
