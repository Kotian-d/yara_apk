import 'package:flutter/material.dart';
import 'package:yara/pages/utils/constants.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool isEmailActive = true;
  bool isMobileAcitve = true;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    mobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMobileAcitve = true;
                      isEmailActive = true;
                    });
                  },
                  child: Text(
                    "Reset Your Password",
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(fontSize: 28.00),
                  ),
                ),
              ),

              if (isMobileAcitve)
                TextFormField(
                  controller: mobile,
                  onTap: () {
                    setState(() {
                      isEmailActive = false;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Username is required";
                    }
                    if (value.toString().trim().length != 10) {
                      return "Mobile number should be 10 digit";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Registered Mobile No",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  ),
                ),

              SizedBox(height: 15),

              if (isEmailActive && isMobileAcitve)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Divider()),
                    Text("  Or  "),
                    Expanded(child: Divider()),
                  ],
                ),
              SizedBox(height: 15),

              if (isEmailActive)
                TextFormField(
                  controller: email,
                  onTap: () {
                    setState(() {
                      isMobileAcitve = false;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return "email is required";
                    }

                    if (!Constants.emailRegex.hasMatch(
                      value.toString().toLowerCase(),
                    )) {
                      return "please enter a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  ),
                ),
              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  //formKey.currentState!.validate();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.00),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "Reset",
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
    );
  }
}
