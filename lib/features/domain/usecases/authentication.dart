import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';
import 'package:meow_films/features/domain/Repository/auth_repository.dart';

// class AuthUseCases implements AuthorizationRepository {
//   final AuthService _authRepository = AuthService();

//   @override
//   Future<User?> checkAuthStatus() {
//     return AuthService.checkAuthStatus();
//   }

//   @override
//   Future<void> signUp(String email, String password, BuildContext context) {
//     return AuthService.signUp(email, password, context);
//   }

//   @override
//   Future<void> login(String email, String password, BuildContext context) {
//     return AuthService.login(email, password, context);
//   }

//   @override
//   Future<void> logout(BuildContext context) {
//     return AuthService.logout(context);
//   }
// }
