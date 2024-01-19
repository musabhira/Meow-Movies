import 'package:meow_films/core/Exception/base_exception.dart';

class EmailVerifyException extends BaseException {
  final String code;
  EmailVerifyException(super.message, this.code);
}
