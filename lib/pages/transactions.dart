import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  DateTimeRange? selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Transaction History",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: _selectDate,
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : '${selectedDate!.start.day}/${selectedDate!.start.month}/${selectedDate!.start.year} - ${selectedDate!.end.day}/${selectedDate!.end.month}/${selectedDate!.end.year}',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              autofocus: false,
              decoration: InputDecoration(
                prefix: Icon(Icons.search),
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    spacing: 16.0,
                    children: [
                      DropdownButton<String>(
                        borderRadius: BorderRadius.circular(4),
                        items: [
                          DropdownMenuItem(value: "All", child: Text("All")),
                          DropdownMenuItem(
                            value: "success",
                            child: Text("success"),
                          ),
                          DropdownMenuItem(
                            value: "Failed",
                            child: Text("Failed"),
                          ),
                          DropdownMenuItem(
                            value: "Pending",
                            child: Text("Pending"),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle dropdown change
                        },
                        hint: Text("Status"),
                      ),

                      DropdownButton<String>(
                        focusColor: Colors.blue,
                        items: [
                          DropdownMenuItem(value: "All", child: Text("All")),
                          DropdownMenuItem(
                            value: "Debit",
                            child: Text("Debit"),
                          ),
                          DropdownMenuItem(
                            value: "Credit",
                            child: Text("Credit"),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle dropdown change
                        },
                        hint: Text("Filter by"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.payment),
                      title: Text("Transaction ${index + 1}"),
                      subtitle: Text("Details of transaction ${index + 1}"),
                      trailing: Column(
                        children: [
                          Icon(
                            Icons.arrow_outward,
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(height: 4),
                          Text("\$${(index + 1) * 10}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
