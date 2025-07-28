import 'package:flutter/material.dart';

class QrGeneratePage extends StatefulWidget {
  const QrGeneratePage({super.key});

  @override
  State<QrGeneratePage> createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends State<QrGeneratePage> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: "0");
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Balance"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Topup Your Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Topup Amount",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            Wrap(
              spacing: 16.0,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade100,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      amountController.text =
                          (int.parse(amountController.text) + 500).toString();
                    });
                  },
                  child: Text("+500"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade100,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      amountController.text =
                          (int.parse(amountController.text) + 1000).toString();
                    });
                  },
                  child: Text("+1000"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade100,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      amountController.text =
                          (int.parse(amountController.text) + 2000).toString();
                    });
                  },
                  child: Text("+2000"),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.shade100,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      amountController.text =
                          (int.parse(amountController.text) + 5000).toString();
                    });
                  },
                  child: Text("+5000"),
                ),
              ],
            ),

            SizedBox(height: 50),

            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.green.shade100),
              ),
              onPressed: () {
                // Logic to cancel
                Navigator.pop(context);
              },
              child: Text("Generate QR"),
            ),
          ],
        ),
      ),
    );
  }
}
