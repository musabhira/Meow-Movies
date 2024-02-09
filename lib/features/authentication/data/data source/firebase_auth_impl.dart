import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meow_films/features/authentication/Data/Data%20Source/firebase_auth.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_impl.g.dart';

class FireBaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethodsImpl(this._auth);

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    try {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    try {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  @override
  Future<void> signOut() async {
    return _auth.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return _auth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      throw AuthenticationFailedException('Cannot login, please try again');
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<(String, int?)> logInWithPhoneNumber(String mobileNUmber) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();
      await _auth.verifyPhoneNumber(
          phoneNumber: mobileNUmber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // log('completed');
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              // log('invalid phone number');
            }
          },
          codeSent: (String? verificationId, int? resendToken) async {
            verificationIdCompleter.complete(verificationId);
            resendTokenCompleter.complete(resendToken);
          },
          codeAutoRetrievalTimeout: (String verificationId) async {
            // log('timeout');
          });
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;
      return (verificationId, newResendToken);
    } on Exception {
      throw AuthenticationFailedException('Cannot login please try again');
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> continueWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      throw AuthenticationFailedException('Cannot login, please try again');
    }
  }
}

@riverpod
FireBaseAuthMethods firebaseAuthMethod(FirebaseAuthMethodRef ref) {
  return FireBaseAuthMethodsImpl(FirebaseAuth.instance);
}
