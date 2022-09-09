import 'package:flutter/material.dart';

class CustomeTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      primaryColor: Colors.purple.shade500,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      iconTheme: IconThemeData(color: Colors.orange.shade600, size: 24),
    );
  }
}
