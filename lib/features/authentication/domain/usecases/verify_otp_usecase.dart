import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class VerifyOtpUseCase {
  final AuthRepository repository;
  VerifyOtpUseCase({required this.repository});

  Future<void> call(String verificationId, String otp) async {
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception catch (e) {
      throw AuthenticationFailedException(e.toString());
    }
  }
}
