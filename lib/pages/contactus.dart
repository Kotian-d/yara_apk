import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yara/pages/utils/textcards.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextCards(
                title: "Customer Support",
                body: [
                  GestureDetector(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber("9739283261");
                    },
                    child: const Text(
                      "Phone: 9739283261",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber("9739283261");
                    },
                    child: const Text(
                      "Phone: 9739283261",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
                icon: Icons.support_agent_outlined,
              ),

              SizedBox(height: 20),

              TextCards(
                title: "WhatsApp Support",
                body: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse("https://wa.me/+919739283261"));
                    },
                    child: const Text(
                      "Whatsapp: 9739283261",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
                icon: Icons.chat,
              ),

              SizedBox(height: 20),

              TextCards(
                title: "Office Hours",
                body: [const Text("Monday - Saturday: 9 AM - 9 PM")],
                icon: Icons.access_time,
              ),

              SizedBox(height: 20),

              TextCards(
                title: "Office Address",
                body: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("https://maps.app.goo.gl/eWGY24jSJSt3wrsX6"),
                      );
                    },
                    child: const Text(
                      "123 Main St, Anytown, USA",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
                icon: Icons.location_on,
              ),

              SizedBox(height: 20),

              TextCards(
                title: "Email Support",
                body: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse("mailto:support@example.com"));
                    },
                    child: const Text("Email: support@example.com"),
                  ),
                ],
                icon: Icons.email,
              ),

              SizedBox(height: 20),

              TextCards(
                title: "Website",
                body: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse("https://www.example.com"));
                    },
                    child: const Text("Website: www.example.com"),
                  ),
                ],
                icon: Icons.public,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
