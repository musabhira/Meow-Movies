import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/core/utils/snakbar_Utils.dart';
import 'package:meow_films/features/Data/Repository/auth_repository_impl.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/Presentation/pages/login_page.dart';
import 'package:meow_films/features/domain/Repository/auth_repository.dart';
import 'package:meow_films/features/domain/usecases/login_use_case.dart';
import 'package:meow_films/features/domain/usecases/logout_use_case.dart';
import 'package:meow_films/features/domain/usecases/sendemail_usecase.dart';
import 'package:meow_films/features/domain/usecases/sign_use_case.dart';
import 'package:meow_films/features/domain/usecases/signin_google_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth2_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;

  @override
  bool build(BuildContext context) {
    repository = ref.read(authRepositoryProvider);
    return false;
  }

  Future<void> sendEmailVerification() async {
    try {
      await SendEmailVerificationUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      await sendEmailVerification();
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await SigninUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut() async {
    try {
      await SignOutUsecase;
      Future.sync(() => context.go(MyHomePage.routepath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      await SignInWithGoogleUseCase(repository: repository)(context);
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }
}
