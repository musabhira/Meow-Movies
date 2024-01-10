import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthorizationRepository {
  Future<User?> checkAuthStatus();
  Future<void> signUp(String email, String password, BuildContext context);
  Future<void> login(String email, String password, BuildContext context);
  Future<void> logout(BuildContext context);
}
