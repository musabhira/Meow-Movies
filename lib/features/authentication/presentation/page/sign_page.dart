import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/core/constant/constant.dart';

import 'package:meow_films/features/authentication/Presentation/Widgets/SignButton_Button_widget.dart';
import 'package:meow_films/features/authentication/Presentation/Widgets/google_sign_widget.dart';

import 'package:meow_films/features/authentication/presentation/page/phonenumber_verfication_page.dart';
import 'package:meow_films/features/authentication/presentation/widgets/textFeild_widget.dart';

class Mysignup extends HookConsumerWidget {
  Mysignup({super.key});
  static const routepath = '/signup';
  // static final TextEditingController emailController = TextEditingController();
  // static final TextEditingController passwordController =
  //     TextEditingController();
  // static final TextEditingController nameController = TextEditingController();

  // final User? user = Auth().currentUser;
  final CollectionReference doner =
      FirebaseFirestore.instance.collection('Meow Movies User');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();

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
                      Constant.signuppageHi,
                      style:
                          TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Constant.signuppageDis,
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
              padding: const EdgeInsets.only(left: 50, top: 20),
              child: SizedBox(
                  width: 300,
                  // color: const Color.fromARGB(255, 16, 136, 235),
                  child: UiHelper.customTextField(
                      nameController,
                      Constant.nametextfieldLabel,
                      Constant.nametextfieldhint,
                      Icons.person_off_outlined,
                      false)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: SizedBox(
                  width: 300,
                  // color: const Color.fromARGB(255, 16, 136, 235),
                  child: UiHelper.customTextField(
                      // ref
                      //     .watch(authenticationProvider(context).notifier)
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
                      //     .watch(authenticationProvider(context).notifier)
                      //     .passwordController,
                      passwordController,
                      Constant.passwordlabel,
                      Constant.passwordhint,
                      Icons.password,
                      true)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: InkWell(
                onTap: () => context.push(PhoneNumber.routePath),
                child: const Text(
                  Constant.enterPhoneNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  top: 30,
                ),
                child: GoogleButton(buttonName: Constant.googleButton)),
            Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  top: 30,
                ),
                child: SignButton(
                    buttonName: Constant.signup,
                    emailController: emailController,
                    passwordController: passwordController)),
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
                child: Image.network(Constant.signingPagePath),
              ),
            )
          ],
        ),
      ),
    );
  }
}
