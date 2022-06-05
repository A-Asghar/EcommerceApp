import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Services/UserManagement/GetUserDetails.dart';
import 'package:ecommerceapp/Services/UserManagement/UpdateUserDetails.dart';
import 'package:ecommerceapp/Widgets/updateDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/Widgets/MyAccountScreenContainer.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 300),
              MyAccountScreenContainer(
                  text: GetUserDetails()
                      .getName(FirebaseAuth.instance.currentUser),
                  icon: const Icon(Icons.person_outline_outlined),
                  onPressed: () async {
                    var newName =
                        await updateDialog(context, 'Name', TextInputType.text);
                    if (newName != null) {
                      setState(() {
                        UpdateUserDetails(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .updateUserName(newName);
                      });
                    }
                  }),
              MyAccountScreenContainer(
                  text: GetUserDetails()
                      .getPhoneNum(FirebaseAuth.instance.currentUser),
                  icon: const Icon(Icons.phone_outlined),
                  onPressed: () async {
                    var newPhoneNumber = await updateDialog(
                        context, 'Phone Number', TextInputType.number);
                    if (newPhoneNumber != null) {
                      setState(() {
                        UpdateUserDetails(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .updateUserPhoneNumber(newPhoneNumber);
                      });
                    }
                  }),
              MyAccountScreenContainer(
                  text: GetUserDetails()
                      .getEmail(FirebaseAuth.instance.currentUser),
                  icon: const Icon(Icons.email_outlined),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    ));
  }
}
