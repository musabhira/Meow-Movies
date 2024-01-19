import 'package:meow_films/core/Exception/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(super.message, this.code);
}
