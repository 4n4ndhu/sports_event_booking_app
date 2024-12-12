import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/firebase_options.dart';
import 'package:sports_event_booking_app/utils/app_theme.dart';
import 'package:sports_event_booking_app/view/corousal_screen/corousal_screen.dart';
import 'package:sports_event_booking_app/view/login_Screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
