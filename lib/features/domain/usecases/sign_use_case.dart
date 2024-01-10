import 'package:flutter/material.dart';
import 'package:meow_films/features/domain/repository/auth_repository.dart';

class SignUp {
  final AuthorizationRepository _authRepository;

  SignUp(this._authRepository);

  Future<void> execute(String email, String password, BuildContext context) {
    return _authRepository.signUp(email, password, context);
  }
}
