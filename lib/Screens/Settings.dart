import 'package:ecommerceapp/Widgets/SettingsScreenContainer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
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
                  child: FlutterLogo(),
                ),
                SettingsScreenContainer(
                    onPressed: () {},
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
                    icon: const Icon(Icons.help_outline, color: Colors.blueGrey)),
                SettingsScreenContainer(
                    onPressed: () {},
                    text: 'Log Out',
                    icon: const Icon(Icons.logout, color: Colors.blueGrey)),
                SettingsScreenContainer(
                    onPressed: () {},
                    text: 'Are you a seller?',
                    icon: const Icon(Icons.add_circle_rounded, color: Colors.blueGrey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
