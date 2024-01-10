import 'package:flutter/material.dart';

passwordMethod(String label, String hint) {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: const Icon(
        Icons.lock,
        color: Color.fromARGB(255, 16, 1, 214),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10),
    ),
  );
}
