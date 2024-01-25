import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:meow_films/features/Data/Data%20Source/auth.dart';
import 'package:meow_films/features/Data/Data%20Source/firebase_auth.dart';
import 'package:meow_films/features/domain/Repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FireBaseAuthMethods dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    return dataSource.signUpWithEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    return dataSource.signInWithEmail(email, password);
  }

  @override
  Future<void> sendEmailVerification() async {
    return await dataSource.sendEmailVerification();
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    return await dataSource.signInWithGoogle(context);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    return await dataSource.sendPasswordResetEmail(email);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(dataSource: ref.watch(firebaseAuthMethodProvider));
}
