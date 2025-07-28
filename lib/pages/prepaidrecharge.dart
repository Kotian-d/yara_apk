import 'package:flutter/material.dart';

class PrepaidRecharge extends StatefulWidget {
  const PrepaidRecharge({super.key});

  @override
  State<PrepaidRecharge> createState() => _PrepaidRechargeState();
}

class _PrepaidRechargeState extends State<PrepaidRecharge> {
  List<dynamic> listofoperator = [
    {"name": "Operator 1", "opcode": "operator1"},
    {"name": "Operator 2", "opcode": "operator2"},
    {"name": "Operator 3", "opcode": "operator3"},
    {"name": "Operator 4", "opcode": "operator4"},
    {"name": "Operator 5", "opcode": "operator5"},
  ];

  final formKey = GlobalKey<FormState>();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController operator = TextEditingController(text: null);
  final TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mobile.dispose();
    operator.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prepaid Recharge"),
        backgroundColor: Colors.green.shade200,
        actionsPadding: EdgeInsets.all(12),
        actions: [
          Row(
            children: [
              Icon(Icons.account_balance_wallet, size: 30),
              Text(" ₹259.00", style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                TextFormField(
                  controller: mobile,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "please enter the mobile number";
                    }
                    if (value.toString().trim().length != 10) {
                      return "Mobile number should be 10 digit";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Mobile No"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                DropdownButtonFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Select Operator",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  ),
                  items:
                      listofoperator
                          .map(
                            (op) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: op["opcode"].toString(),
                              child: Row(
                                spacing: 25,
                                children: [
                                  CircleAvatar(child: Icon(Icons.wallet)),
                                  Text(op["name"].toString()),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    operator.text = value.toString();
                  },
                ),

                SizedBox(height: 15),

                TextFormField(
                  autofocus: false,
                  controller: amount,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return "please enter the amount";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close, weight: 35),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 45.0,
                                          child: Icon(Icons.wallet),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Are you sure want to recharge ${mobile.text.toString()} with Rs.${amount.text.toString()} ?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    //formKey.currentState!.validate();
                                    mobile.clear();
                                    operator.clear();
                                    amount.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Confirm"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.00),
                      color: Colors.lightGreen.shade500,
                    ),
                    child: Center(
                      child: Text(
                        "Recharge",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.00,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
