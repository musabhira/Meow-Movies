import 'package:meow_films/core/Exception/base_exception.dart';

class SigninException extends BaseException {
  final String code;
  SigninException(super.message, this.code);
}
