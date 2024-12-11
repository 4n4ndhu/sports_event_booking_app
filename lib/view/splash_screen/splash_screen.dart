import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: ColorConstans.primaryGreen,
              radius: 120,
              child: Center(
                child: Text("Sportzia",
                    style: TextStyle(
                        color: ColorConstans.primaryBlack,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
