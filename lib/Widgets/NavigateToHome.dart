import 'package:flutter/material.dart';
import '../Screens/NavigationBar.dart';

class NavigateToHome extends StatelessWidget {
  const NavigateToHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NavBar(),
        ));
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
    );
  }
}
