import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Presentation/Providers/auth2_provider.dart';

import 'package:meow_films/features/Presentation/Widgets/textFeild_widget.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';

class MyLoggingPage extends HookConsumerWidget {
  // final AuthController? authController;
  MyLoggingPage({
    super.key,
  });
  static const routepath = '/login';
  // static final TextEditingController emailController = TextEditingController();
  // static final TextEditingController passwordController =
  //     TextEditingController();
  //     final emailController = useTextEditingController();
  // final passwordController = useTextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // final email =
    //     ref.read(authenticationProvider(context).notifier).emailController;
    // final password =
    //     ref.read(authenticationProvider(context).notifier).passwordController;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 240,
                height: 120,
                // color: Colors.red,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constant.welcome,
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Constant.singinto,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 70),
              child: SizedBox(
                  width: 300,
                  // color: const Color.fromARGB(255, 16, 136, 235),
                  child: UiHelper.customTextField(
                      // ref
                      //     .read(authenticationProvider(context).notifier)
                      //     .emailController,
                      emailController,
                      Constant.emailLabel,
                      Constant.emailhint,
                      Icons.mail,
                      false)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: SizedBox(
                  width: 300,
                  // color: const Color.fromARGB(255, 16, 136, 235),
                  child: UiHelper.customTextField(
                      // ref
                      //     .read(authenticationProvider(context).notifier)
                      //     .passwordController,
                      passwordController,
                      Constant.passwordlabel,
                      Constant.emailhint,
                      Icons.password,
                      true)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                top: 30,
              ),
              child: SizedBox(
                child: SizedBox(
                  width: 230,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (FirebaseAuth.instance.currentUser != null) {
                      //   ref
                      //       .read(authenticationProvider(context).notifier)
                      //       .signUpWithEmail(
                      //         emailController.text,
                      //         passwordController.text,
                      //       );
                      //   // context.go(MyMainHome.routePath);
                      // }
                      ref
                          .read(authenticationProvider(context).notifier)
                          .signInWithEmail(
                              emailController.text, passwordController.text);
                      // context.go(MyMainHome.routePath);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 16, 1, 214),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      Constant.loginbutton,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  Constant.forgot,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 31, top: 10),
              child: SizedBox(
                width: 280,
                height: 210,
                // color: Colors.black87,
                child: Image.network(Constant.forgotimagepath),
              ),
            )
          ],
        ),
      ),
    );
  }
}
