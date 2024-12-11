import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green))),
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: Colors.white, fontSize: 18)));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green))),
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: Colors.black, fontSize: 18)));
}
