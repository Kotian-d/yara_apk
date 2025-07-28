import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset("assets/images/avatar.png"),
            ),
            SizedBox(height: 20),
            TextField(
              autofocus: false,
              controller: TextEditingController(text: "John Doe"),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              autofocus: false,
              controller: TextEditingController(text: "john.doe@example.com"),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              autofocus: false,
              controller: TextEditingController(text: "John Store"),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Outlet",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              autofocus: false,
              controller: TextEditingController(text: "+919123456789"),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              autofocus: false,
              controller: TextEditingController(
                text: "123 Main St, City, Country",
              ),
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save profile logic here
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.green.shade200,
                backgroundColor: Colors.black,
              ),
              child: Text("Save Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
