import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/core/utils/snakbar_Utils.dart';
import 'package:meow_films/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:meow_films/features/authentication/domain/Repository/auth_repository.dart';
import 'package:meow_films/features/authentication/domain/usecases/continueWithGoogle_usecase.dart';
import 'package:meow_films/features/authentication/domain/usecases/login_use_case.dart';
import 'package:meow_films/features/authentication/domain/usecases/login_with_phone.dart';
import 'package:meow_films/features/authentication/domain/usecases/logout_use_case.dart';
import 'package:meow_films/features/authentication/domain/usecases/sendemail_usecase.dart';
import 'package:meow_films/features/authentication/domain/usecases/sign_use_case.dart';
import 'package:meow_films/features/authentication/domain/usecases/signin_google_usecase.dart';
import 'package:meow_films/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:meow_films/features/authentication/presentation/page/login_page.dart';
import 'package:meow_films/features/authentication/presentation/page/otp_verification.dart';
import 'package:meow_films/features/authentication/presentation/providers/auth_state.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/bottom_navi_widget.dart';

import 'package:meow_films/features/home_page/Presentation/pages/home_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;

  @override
  AuthState build() {
    repository = ref.read(authRepositoryProvider);
    // ref.onDispose(() { })
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await SendEmailVerificationUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signUpWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      await sendEmailVerification(context);
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await SigninUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(bottooomPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await SignOutUsecase;
      Future.sync(() => context.go(MyHomePage.routepath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await SignInWithGoogleUseCase(repository: repository)(context);
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await SendEmailVerificationUseCase(repository: repository);
      // Future.sync(() => context.go(MyMainHome.path));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUseCase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(MyMainHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> loginWithPhoneNumber(
      BuildContext context, String mobileNumber) async {
    try {
      final verificationData =
          await LoginWithPhoneNumber(repository: repository)(mobileNumber);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(OtpVerification.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> continueWithGoogle(BuildContext context) async {
    try {
      await ContinueWithGoogleUseCase(repository: repository)();
      Future.sync(() => context.go(bottooomPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }
}
