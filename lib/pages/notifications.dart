import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: 10, // Example item count
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification ${index + 1}"),
              subtitle: Text("Details of notification ${index + 1}"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
