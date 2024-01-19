import 'package:meow_films/core/Exception/base_exception.dart';

class SignupException extends BaseException {
  final String code;
  SignupException(super.message, this.code);
}
