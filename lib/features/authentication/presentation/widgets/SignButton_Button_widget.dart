import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:meow_films/features/authentication/presentation/providers/auth_provider.dart';

class SignButton extends HookConsumerWidget {
  final String buttonName;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignButton(
      {Key? key,
      required this.buttonName,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final email =
    //     ref.read(authenticationProvider(context).notifier).emailController;
    // final password =
    //     ref.read(authenticationProvider(context).notifier).passwordController;
    // static   final emailController = useTextEditingController();

    return SizedBox(
      width: 230,
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          // if (FirebaseAuth.instance.currentUser != null) {
          //   ref.read(authenticationProvider(context).notifier).signUpWithEmail(
          //         email.text,
          //         password.text,
          //       );
          // }
          ref.read(authenticationProvider.notifier).signUpWithEmail(
              emailController.text, passwordController.text, context);
          // context.go(MyHome);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 16, 1, 214),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(buttonName),
      ),
    );
  }
}
