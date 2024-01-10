import 'package:flutter/material.dart';

import 'package:meow_films/features/Presentation/Widgets/Alert_box_widget.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/Presentation/pages/login_main_page.dart';

class AuthNavigator {
  static void navigateToHomePage() {
    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => MyMainHome()),
    );
  }

  static void navigateToLoginPage() {
    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => MyLoggingPage()),
    );
  }

  static void showAlert(String message) {
    CustomAlertBox.show(_context!, message);
  }

  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }
}
