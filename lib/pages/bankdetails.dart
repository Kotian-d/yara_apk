import 'package:flutter/material.dart';

class Bankdetails extends StatelessWidget {
  const Bankdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Details"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            BankCard(
              title: "Example Bank",
              subtitle: "Primary A/c",
              body: [
                Text("Account Number: 1234567890"),
                Text("Account Holder: Deekshith S Kotian"),
                Text("Bank Branch: Main Branch"),
                Text("IFSC Code: EXAM1234"),
                Text("UPI ID: example@upi"),
              ],
            ),
            SizedBox(height: 20),
            BankCard(
              title: "Example2 Bank",
              subtitle: "Secondary A/c",
              body: [
                Text("Account Number: 0987654321"),
                Text("Account Holder: Deekshith S Kotian"),
                Text("Bank Branch: Main Branch"),
                Text("IFSC Code: EXAM4321"),
                Text("UPI ID: example2@upi"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  const BankCard({this.title, this.subtitle, this.body, super.key});

  final String? title;
  final String? subtitle;
  final List<Widget>? body;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? "Bank Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      subtitle!,
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
              ],
            ),
          ),

          if (body != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: body!,
              ),
            ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}
