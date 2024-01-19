import 'package:firebase_auth/firebase_auth.dart';
import 'package:meow_films/core/Exception/Auth/signout_exception.dart';
import 'package:meow_films/features/domain/Repository/auth_repository.dart';

final class SignOutUsecase {
  final AuthRepository repository;
  SignOutUsecase({required this.repository});

  Future<void> call() async {
    try {
      return await repository.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(
          e.message ?? 'SIgnOut Failed Please Retry', e.code);
    }
  }
}
