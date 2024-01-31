import 'package:firebase_auth/firebase_auth.dart';
import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:meow_films/core/Exception/Auth/emailverfy_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class sendPasswordResetEmailUseCase {
  final AuthRepository repository;
  sendPasswordResetEmailUseCase({required this.repository});

  Future<void> call(String email) async {
    try {
      await repository.sendPasswordResetEmail(email);
    } on Exception catch (e) {
      throw AuthenticationFailedException('$e');
    }
  }
}
