import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/authentication/presentation/providers/auth_provider.dart';

import 'package:meow_films/features/authentication/presentation/widgets/textFeild_widget.dart';

class OtpVerification extends HookConsumerWidget {
  const OtpVerification({super.key});
  static const routePath = '/otpverification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          // color: Colors.blueAccent,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: SizedBox(
                    width: 300,
                    // color: const Color.fromARGB(255, 16, 136, 235),
                    child: UiHelper.customTextField(
                        otpController,
                        Constant.enterOtpNumber,
                        Constant.enterOtpNumber,
                        Icons.password,
                        false)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 290,
                height: 35,
                child: ElevatedButton(
                  onPressed: () => ref
                      .read(authenticationProvider.notifier)
                      .verifyOtp(context, otpController.text),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 16, 1, 214),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: const Text(
                    Constant.conformOtp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
