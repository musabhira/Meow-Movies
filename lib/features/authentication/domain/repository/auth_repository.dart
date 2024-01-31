import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<void> signInWithGoogle(BuildContext context);
  Future<void> sendPasswordResetEmail(String email);
  Future<(String, int?)> logInWithPhoneNumber(String mobileNUmber);
  Future<void> verifyOtp(String verificationId, String otp);
}
