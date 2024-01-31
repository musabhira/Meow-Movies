import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class SignInWithGoogleUseCase {
  final AuthRepository repository;
  SignInWithGoogleUseCase({required this.repository});

  Future<void> call(BuildContext context) async {
    try {
      await repository.signInWithGoogle(context);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationFailedException(
          e.message ?? "Google Verification failed please retry");
    }
  }
}
