import 'package:firebase_auth/firebase_auth.dart';
import 'package:meow_films/core/Exception/Auth/invalid_exception.dart';
import 'package:meow_films/core/Exception/Auth/signup_exception.dart';

import 'package:meow_films/features/domain/Repository/auth_repository.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.signUpWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SignupException(e.message ?? "Sign up failed please retry", e.code);
    }
  }
}
