import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://via.placeholder.com/150"), // Replace with actual image URL
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Options
            ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text("Account Details"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.green),
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.green),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.green),
              title: Text("Help & Support"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.green),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
