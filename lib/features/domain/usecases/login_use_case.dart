import 'package:flutter/material.dart';
import 'package:meow_films/features/domain/repository/auth_repository.dart';

class Login {
  final AuthorizationRepository _authRepository;

  Login(this._authRepository);

  Future<void> execute(String email, String password, BuildContext context) {
    return _authRepository.login(email, password, context);
  }
}
