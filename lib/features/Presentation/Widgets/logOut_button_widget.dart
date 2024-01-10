import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';

class MyLogOutButton extends StatelessWidget {
  // const MyLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await AuthService.logout(context);
        },
        child: const Text(Constant.logOut));
  }
}
