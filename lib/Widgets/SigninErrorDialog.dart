import 'package:flutter/material.dart';

void signinErrorDialog(String e, context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('The following error has occurred : '),
          content: Text(e.toString()),
        );
      });
}