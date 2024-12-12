import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';
import 'package:sports_event_booking_app/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:sports_event_booking_app/view/home_screen/home_screen.dart';
import 'package:sports_event_booking_app/view/login_Screen/login_screen.dart';
import 'package:sports_event_booking_app/view/splash_screen/splash_screen.dart';

class CorousalScreen extends StatefulWidget {
  const CorousalScreen({super.key});

  @override
  State<CorousalScreen> createState() => _CorousalScreenState();
}

class _CorousalScreenState extends State<CorousalScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> myImages = [
    "https://images.pexels.com/photos/3131405/pexels-photo-3131405.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1127120/pexels-photo-1127120.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/4747325/pexels-photo-4747325.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavbarScreen();
        } else {
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: myImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(myImages[index]),
                          fit: BoxFit.cover)),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "india is my country all indians are my brothers and sisters i love my country and im proud of its rich and variage heritage ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                left: 200,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: _currentIndex == myImages.length - 2 ||
                          _currentIndex == myImages.length - 3
                      ? TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.slowMiddle,
                            );
                          },
                          child: Text(
                            "skip",
                            style: TextStyle(color: ColorConstans.primaryGreen),
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            if (_currentIndex == myImages.length - 1) {
                              // Navigate to HomeScreen on the last page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            } else {
                              // Move to the next page manually
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.slowMiddle,
                              );
                            }
                          },
                          child: Text(
                            _currentIndex == myImages.length - 1
                                ? "Get Started"
                                : "skip",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                ),
              ),
            ],
          );
        }
      },
    ));
  }
}
