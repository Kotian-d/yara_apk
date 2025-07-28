import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yara/pages/addmoney.dart';
import 'package:yara/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:yara/pages/prepaidrecharge.dart';
import 'package:yara/pages/utils/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTimeRange? selectedDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  final today = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  final yesterday = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 1,
  );

  Future<void> _selectDate() async {
    final DateTimeRange? pickedDate = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDateRange:
          selectedDate != null
              ? DateTimeRange(
                start: selectedDate!.start,
                end: selectedDate!.end,
              )
              : DateTimeRange(start: DateTime.now(), end: DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  final List quickactions = [
    {
      "icons": Icons.phone_android,
      "label": "Prepaid Mobile",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.satellite, "label": "DTH", "route": PrepaidRecharge()},
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
    {"icons": Icons.traffic, "label": "Fastag", "route": PrepaidRecharge()},
    {
      "icons": Icons.health_and_safety,
      "label": "Insurance",
      "route": PrepaidRecharge(),
    },
    {
      "icons": Icons.directions_bus,
      "label": "Bus Ticket",
      "route": PrepaidRecharge(),
    },
  ];

  final List operators = [
    {
      "icons": Icons.phone_android,
      "label": "Prepaid Mobile",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.satellite, "label": "DTH", "route": PrepaidRecharge()},
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
    {"icons": Icons.traffic, "label": "Fastag", "route": PrepaidRecharge()},
    {
      "icons": Icons.health_and_safety,
      "label": "Insurance",
      "route": PrepaidRecharge(),
    },
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
    {"icons": Icons.gas_meter, "label": "Gas", "route": PrepaidRecharge()},
    {"icons": Icons.router, "label": "Brodband", "route": PrepaidRecharge()},
    {
      "icons": Icons.money,
      "label": "Loan Repayment",
      "route": PrepaidRecharge(),
    },
    {"icons": Icons.live_tv, "label": "Cable TV", "route": PrepaidRecharge()},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context.read<DashboardCubit>().getBalance();
    });
  }

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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 15),

              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: Search(
                      data:
                          operators.map((e) => e['label'].toString()).toList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    spacing: 6.0,
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade500),
                      Text(
                        "Search for services, operators, or recharge",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardLoadingState) {
                    return LottieBuilder.asset("assets/card_skeleton1.json");
                  } else if (state is DashboardLoadedState) {
                    final body = state.response;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.teal.shade300, Colors.teal.shade200],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 18,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Wallet Balance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "₹ ${body.balance.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddMoney(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text("ADD Money"),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text(state.toString()));
                  }
                },
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: _selectDate,
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : selectedDate!.start == today
                        ? "Today"
                        : selectedDate!.start == yesterday
                        ? "Yesterday"
                        : '${selectedDate!.start.day}/${selectedDate!.start.month}/${selectedDate!.start.year} - ${selectedDate!.end.day}/${selectedDate!.end.month}/${selectedDate!.end.year}',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),

              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardLoadingState) {
                    return LottieBuilder.asset("assets/card_skeleton.json");
                  } else if (state is DashboardLoadedState) {
                    final body = state.response;
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Opening",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Text(body.opening.toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Purchase",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Text(body.purchase.toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sale",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Text(body.sale.toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Comm",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Text(body.commission.toStringAsFixed(2)),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: Text(state.toString()));
                  }
                },
              ),

              SizedBox(height: 15),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quick Actions",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.teal.shade50,
                              showDragHandle: true,
                              context: context,
                              builder: (context) {
                                return GridView.builder(
                                  itemCount: operators.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                      ),
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
                                                      operators[index]["route"],
                                            ),
                                          );
                                        },
                                        child: GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.teal.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),

                                            width: 25,
                                            height: 25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  operators[index]["icons"],
                                                  color: Colors.teal.shade800,
                                                ),
                                                Text(
                                                  operators[index]["label"],
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
                                );
                              },
                            );
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: quickactions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // two columns
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrepaidRecharge(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                quickactions[index]["icons"],
                                color: Colors.teal.shade800,
                              ),
                              Text(
                                quickactions[index]["label"],
                                style: TextStyle(
                                  color: Colors.teal.shade800,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Trending",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
