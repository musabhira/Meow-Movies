import 'package:meow_films/core/Exception/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  InvalidCredentialsException() : super("Invalid user input");
}
