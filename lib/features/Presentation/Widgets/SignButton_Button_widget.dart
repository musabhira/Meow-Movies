import 'package:flutter/material.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';
import 'package:meow_films/features/Presentation/pages/sign_page.dart';

signButton(
  String buttonName,
) {
  return SizedBox(
    width: 230,
    height: 35,
    child: ElevatedButton(
      onPressed: () {
        onPressedSignUp(BuildContext context) {
          AuthService.signUp(
            context,
            Mysignup.emailController.text.toString(),
            Mysignup.passwordController.text.toString(),
          );
        }
      },
      style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 16, 1, 214),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        buttonName,
      ),
    ),
  );
}
