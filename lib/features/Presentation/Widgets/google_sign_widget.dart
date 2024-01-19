import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:meow_films/features/Presentation/Providers/auth2_provider.dart';

class GoogleButton extends HookConsumerWidget {
  final String buttonName;
  // final TextEditingController emailController;
  // final TextEditingController passwordController;

  GoogleButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 230,
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          ref.read(authenticationProvider(context).notifier).signinWithGoogle();
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
