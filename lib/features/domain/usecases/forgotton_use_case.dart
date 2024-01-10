import 'package:flutter/material.dart';
import 'package:meow_films/features/domain/repository/auth_repository.dart';

class Logout {
  final AuthorizationRepository authRepository;

  Logout(this.authRepository);

  Future<void> execute(BuildContext context) {
    return authRepository.logout(context);
  }
}
