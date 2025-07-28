import 'package:flutter/material.dart';
import 'package:yara/pages/prepaidrecharge.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final List prepaidServices = [
    {
      "icons": Icons.phone_android,
      "label": "Prepaid Mobile",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.satellite, "label": "DTH", "route": PrepaidRecharge()},
    {"icons": Icons.traffic, "label": "Fastag", "route": PrepaidRecharge()},
    {"icons": Icons.gas_meter, "label": "Gas", "route": PrepaidRecharge()},
    {
      "icons": Icons.play_arrow,
      "label": "Google Play",
      "route": PrepaidRecharge(),
    },
  ];

  final List utilityServices = [
    {
      "icons": Icons.phone_android,
      "label": "Postpaid Mobile",
      "route": PrepaidRecharge(),
    },
    {
      "icons": Icons.electric_bolt_outlined,
      "label": "Electricity",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.phone, "label": "Landline", "route": PrepaidRecharge()},
    {
      "icons": Icons.health_and_safety,
      "label": "Insurance",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.water_drop, "label": "Water", "route": PrepaidRecharge()},
    {"icons": Icons.router, "label": "Brodband", "route": PrepaidRecharge()},
    {
      "icons": Icons.money,
      "label": "Loan Repayment",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.live_tv, "label": "Cable TV", "route": PrepaidRecharge()},
    {"icons": Icons.school, "label": "School Fees", "route": PrepaidRecharge()},
    {
      "icons": Icons.local_hospital,
      "label": "Hospital Bills",
      "route": PrepaidRecharge(),
    },
    {
      "icons": Icons.local_atm,
      "label": "Credit Card",
      "route": PrepaidRecharge(),
    },
  ];

  final List bookingServices = [
    {
      "icons": Icons.directions_bus,
      "label": "Bus Ticket",
      "route": PrepaidRecharge(),
    },
    {
      "icons": Icons.satellite_alt,
      "label": "New DTH Booking",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.wifi, "label": "Book Airfiber", "route": PrepaidRecharge()},
    {"icons": Icons.train, "label": "Train", "route": PrepaidRecharge()},
    {"icons": Icons.flight, "label": "Flight", "route": PrepaidRecharge()},
    {"icons": Icons.bed, "label": "Hotel Booking", "route": PrepaidRecharge()},
    {"icons": Icons.movie, "label": "Movie Ticket", "route": PrepaidRecharge()},
    {
      "icons": Icons.event,
      "label": "Event Booking",
      "route": PrepaidRecharge(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade200, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 15.0,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Prepaid Services",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents nested scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                          itemCount: prepaidServices.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              prepaidServices[index]["route"],
                                    ),
                                  );
                                },
                                child: GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: 25,
                                    height: 25,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          prepaidServices[index]["icons"],
                                          color: Colors.teal.shade800,
                                        ),
                                        Text(
                                          prepaidServices[index]["label"],
                                          style: TextStyle(
                                            color: Colors.teal.shade800,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Utilities Services",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents nested scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                          itemCount: utilityServices.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              utilityServices[index]["route"],
                                    ),
                                  );
                                },
                                child: GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: 25,
                                    height: 25,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          utilityServices[index]["icons"],
                                          color: Colors.teal.shade800,
                                        ),
                                        Text(
                                          utilityServices[index]["label"],
                                          style: TextStyle(
                                            color: Colors.teal.shade800,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Booking",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents nested scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                          itemCount: bookingServices.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: GestureDetector(
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                bookingServices[index]["route"],
                                      ),
                                    ),
                                child: GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: 25,
                                    height: 25,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          bookingServices[index]["icons"],
                                          color: Colors.teal.shade800,
                                        ),
                                        Text(
                                          bookingServices[index]["label"],
                                          style: TextStyle(
                                            color: Colors.teal.shade800,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
