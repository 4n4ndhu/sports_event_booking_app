import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/view/home_screen/home_screen.dart';
import 'package:sports_event_booking_app/view/profile_section/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  List screens = [
    HomeScreen(),
    Container(
      color: Colors.red,
    ),
    ProfileScreen()
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: _buil_bottomnavbar(),
    );
  }

  BottomNavigationBar _buil_bottomnavbar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        currentIndex: selected,
        onTap: (value) {
          selected = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            activeIcon: Icon(
              Icons.add,
            ),
            label: "add",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: "You",
          ),
        ]);
  }
}
