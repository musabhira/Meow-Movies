import 'package:meow_films/core/Exception/Auth/auth_failed_exception.dart';
import 'package:meow_films/core/Exception/Auth/invalid_exception.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';

final class LoginWithPhoneNumber {
  final AuthRepository repository;
  LoginWithPhoneNumber({required this.repository});

  Future<(String, int?)> call(String mobileNumber) async {
    if (mobileNumber.trim().isEmpty) {
      throw InvalidCredentialsException();
    } else {
      try {
        return repository.logInWithPhoneNumber(mobileNumber);
      } on Exception {
        throw AuthenticationFailedException('');
      }
    }
  }
}
