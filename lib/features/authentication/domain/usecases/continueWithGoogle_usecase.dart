import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class ContinueWithGoogleUseCase {
  final AuthRepository repository;
  ContinueWithGoogleUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.continueWithGoogle();
    } on Exception {
      throw AuthenticationFailedException(
          'Verification failed, please try again');
    }
  }
}
