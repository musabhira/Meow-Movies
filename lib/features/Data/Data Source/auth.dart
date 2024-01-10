import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Presentation/Widgets/Alert_box_widget.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';

import 'package:meow_films/features/Presentation/pages/login_page.dart';

class AuthService {
  static Future<User?> checkAuthStatus() async {
    return FirebaseAuth.instance.currentUser;
  }

  static Future<void> signUp(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CustomAlertBox.show(context, Constant.logingError);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyMainHome()),
        );
      } on FirebaseAuthException catch (e) {
        return CustomAlertBox.show(context, e.code.toString());
      }
    }
  }

  static Future<void> login(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CustomAlertBox.show(context, Constant.logingError);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyMainHome()),
        );
      } on FirebaseAuthException catch (e) {
        return CustomAlertBox.show(context, e.code.toString());
      }
    }
  }

  static Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } catch (e) {
      print("Error during sign out: $e");
    }
  }
}















// class Auth {
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   User? get currentUser => _firebaseAuth.currentUser;

//   Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

//   Future<void> signInWithEmailandPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<void> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }
