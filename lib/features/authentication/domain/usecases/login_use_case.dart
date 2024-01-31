import 'package:firebase_auth/firebase_auth.dart';
import 'package:meow_films/core/Exception/Auth/invalid_exception.dart';
import 'package:meow_films/core/Exception/Auth/signin_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class SigninUsecase {
  final AuthRepository repository;
  SigninUsecase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.signInWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SigninException(e.message ?? "Sign up failed please retry", e.code);
    }
  }
}
