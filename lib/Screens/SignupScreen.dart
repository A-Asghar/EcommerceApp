import 'package:ecommerceapp/Screens/LoginScreen.dart';
import 'package:ecommerceapp/Services/UserManagement/AddUser.dart';
import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:ecommerceapp/Widgets/SigninErrorDialog.dart';
import 'package:ecommerceapp/Widgets/UserInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'NavigationBar.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

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
            'Sign up',
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
                  'Sign Up',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: const Text(
                  'Sign Up using your email ID and password',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              userInput('Email', TextInputType.emailAddress, _email, false, 50),
              userInput(
                  'Password', TextInputType.visiblePassword, _password, true, 20),
              userInput('Confirm Password', TextInputType.visiblePassword,
                  _confirmPassword, true, 20),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child:
                    Text('By signing up, you agree to the Terms & Conditions.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: TextButton(
                  child: Text('Already have an account? Login!'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                ),
              ),
              MultiPurposeButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _email.text, password: _password.text)
                        .then((signedInUser) {
                      AddUser().storeNewUser(signedInUser.user!.uid);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ));
                    }).catchError((e) {
                      signinErrorDialog(e.code, context);
                    });
                  },
                  buttonText: 'Signup')
            ],
          ),
        )),
      ),
    );
  }
}
