import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';

class MyLogOutButton extends StatelessWidget {
  // const MyLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          // await FirebaseAuthSource.logout(context);
        },
        child: const Text(Constant.logOut));
  }
}
