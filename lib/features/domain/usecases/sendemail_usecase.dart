import 'package:firebase_auth/firebase_auth.dart';
import 'package:meow_films/core/Exception/Auth/emailverfy_exception.dart';
import 'package:meow_films/features/domain/Repository/auth_repository.dart';

final class SendEmailVerificationUseCase {
  final AuthRepository repository;
  SendEmailVerificationUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EmailVerifyException(e.message ?? 'Email verification', e.code);
    }
  }
}
