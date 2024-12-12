import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';
import 'package:sports_event_booking_app/view/home_screen/widget/drawer_listile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ));
        }),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Anandhu S"),
              ),
              SizedBox(
                height: 15,
              ),
              drawerListile(
                text: 'your profile',
                icon: Icon(Icons.person),
                onpress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              drawerListile(
                text: "My events",
                icon: Icon(Icons.event),
                onpress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              drawerListile(
                text: "inbox",
                icon: Icon(Icons.message),
                onpress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              drawerListile(
                text: "Share App",
                icon: Icon(Icons.share),
                onpress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              drawerListile(
                text: "Settings",
                icon: Icon(Icons.settings),
                onpress: () {},
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
