import 'package:ecommerceapp/Widgets/SettingsScreenContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AddProductScreen.dart';
import 'LoginScreen.dart';
import 'MyAccountScreen.dart';
import 'NavigationBar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NavBar(),
                ));
              },
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const FlutterLogo(),
                  ),
                  SettingsScreenContainer(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyAccount(),
                        ));
                      },
                      text: 'My Account',
                      icon: const Icon(
                        Icons.person_outline_outlined,
                        color: Colors.blueGrey,
                      )),
                  SettingsScreenContainer(
                      onPressed: () {},
                      text: 'Settings',
                      icon: const Icon(Icons.settings, color: Colors.blueGrey)),
                  SettingsScreenContainer(
                      onPressed: () {},
                      text: 'Help Center',
                      icon: const Icon(Icons.help_outline,
                          color: Colors.blueGrey)),
                  SettingsScreenContainer(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      text: 'Log Out',
                      icon: const Icon(Icons.logout, color: Colors.blueGrey)),
                  SettingsScreenContainer(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddProductScreen(),
                        ));
                      },
                      text: 'Are you a seller?',
                      icon: const Icon(Icons.add_circle_rounded,
                          color: Colors.blueGrey)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
