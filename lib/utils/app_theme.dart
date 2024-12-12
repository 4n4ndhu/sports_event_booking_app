import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      drawerTheme: DrawerThemeData(backgroundColor: Colors.grey),
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green))),
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: Colors.white, fontSize: 18)));
  static ThemeData darkTheme = ThemeData(
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green))),
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: Colors.black, fontSize: 18)));
}
