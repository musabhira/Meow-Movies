import 'package:flutter/material.dart';

class UiHelper {
  static TextField customTextField(TextEditingController controller,
      String text, String hint, IconData iconData, bool toHide) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        labelText: text,
        hintText: text,
        prefixIcon: Icon(
          iconData,
          color: Color.fromARGB(255, 16, 1, 214),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
