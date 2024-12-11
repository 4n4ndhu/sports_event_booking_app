import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/app_theme.dart';
import 'package:sports_event_booking_app/view/corousal_screen/corousal_screen.dart';
import 'package:sports_event_booking_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.lightTheme,
      home: CorousalScreen(),
    );
  }
}
