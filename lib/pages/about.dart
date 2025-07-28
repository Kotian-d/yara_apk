import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.green.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "🏢 About Us – ABC Company LTD",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "At ABC Company LTD, we believe in simplifying everyday transactions while empowering our partners with fair and transparent earnings. Since our inception, we’ve been committed to delivering seamless solutions in mobile recharges, utility bill payments, and travel bookings across bus, train, and flight platforms.",
              ),
              SizedBox(height: 20),
              Text(
                "🎯 Our Mission To offer dependable digital services that make life easier for users and provide sustainable income opportunities for retailers and resellers.",
              ),
              SizedBox(height: 20),
              Text(
                "💡 What We Offer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "1. 📱 Instant Mobile & DTH Recharges – Fast, secure, and available for all major operators.\n"
                "2. 💡 Utility Bill Payments – Pay electricity, water, gas, and other essential bills with zero hassle.\n"
                "3. 🚌🚆✈️ Bus, Train, and Flight Bookings – Affordable and reliable travel options, all under one roof.\n"
                "4. 💰 Fair Commission Model – We believe in rewarding trust. That’s why we offer competitive commissions on all recharge services, helping our partners grow.",
              ),
              SizedBox(height: 20),
              Text(
                "🌐 Whether you're an end-user seeking convenience or a retailer looking for growth, ABC Company LTD is your trusted digital partner—streamlining services, supporting businesses, and moving India forward one transaction at a time.",
              ),
              SizedBox(height: 20),
              Text(
                "Join us in our journey to make digital transactions accessible and rewarding for everyone!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
