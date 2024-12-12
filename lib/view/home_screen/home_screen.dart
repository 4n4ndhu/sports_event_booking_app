import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';
import 'package:sports_event_booking_app/view/home_screen/widget/drawer_listile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sportsEvents = [
      {
        'image':
            'https://via.placeholder.com/150', // Replace with your sports image URL
        'name': 'Football',
        'time': '5:00 PM',
        'location': 'Central Park',
      },
      {
        'image':
            'https://via.placeholder.com/150', // Replace with your sports image URL
        'name': 'Basketball',
        'time': '7:00 PM',
        'location': 'Community Center',
      },
      {
        'image':
            'https://via.placeholder.com/150', // Replace with your sports image URL
        'name': 'Tennis',
        'time': '3:00 PM',
        'location': 'Sports Complex',
      },
      {
        'image':
            'https://via.placeholder.com/150', // Replace with your sports image URL
        'name': 'Cricket',
        'time': '1:00 PM',
        'location': 'City Stadium',
      },
    ];
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: sportsEvents.length,
          itemBuilder: (context, index) {
            final event = sportsEvents[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Stack(
                children: [
                  // Event Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.network(
                          event['image']!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['name']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text("Time: ${event['time']}"),
                            const SizedBox(height: 4),
                            Text("Location: ${event['location']}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Book Button
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle book action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Booking ${event['name']}')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("Book"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
