import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';

class CustomAlertBox {
  static Future<void> show(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(Constant.alertOk))
          ],
        );
      },
    );
  }
}
