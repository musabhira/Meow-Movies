import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';

import 'package:meow_films/features/Presentation/Widgets/SignButton_Button_widget.dart';

import 'package:meow_films/features/Presentation/Widgets/textFeild_widget.dart';

class Mysignup extends StatefulWidget {
  Mysignup({super.key});
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController nameController = TextEditingController();

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  // final User? user = Auth().currentUser;

  final CollectionReference doner =
      FirebaseFirestore.instance.collection('Meow Movies User');

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
                      Mysignup.nameController,
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
                      Mysignup.emailController,
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
                      Mysignup.passwordController,
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
                child: signButton(Constant.signup)),
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
