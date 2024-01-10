import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';

import 'package:meow_films/features/Presentation/Widgets/textFeild_widget.dart';

class MyLoggingPage extends StatefulWidget {
  MyLoggingPage({super.key});

  @override
  State<MyLoggingPage> createState() => _MyLoggingPageState();
}

class _MyLoggingPageState extends State<MyLoggingPage> {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      AuthService.login(
                          context,
                          emailController.text.toString(),
                          passwordController.text.toString());
                      // login(emailController.text.toString(),
                      //     passwordController.text.toString());
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
