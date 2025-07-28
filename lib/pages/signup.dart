import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yara/pages/login.dart';
import 'package:yara/pages/signup/cubit/signup_cubit.dart';
import 'package:yara/pages/utils/constants.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  //final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccessState) {
              //formKey.currentState!.reset();
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("Signup Success"),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                          );
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            } else if (state is SignupErrorState) {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("Signup Error"),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) {
            if (state is SignupLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else {
              final signupCubit = context.read<SignupCubit>();
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.00,
                  vertical: 15.00,
                ),
                child: Form(
                  key: signupCubit.fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Sign Up To Get Started",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(fontSize: 28),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Name is required";
                          }
                          if (value.toString().trim().length < 3) {
                            return "Name should be atleast 3 Characters long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.mobileController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Mobile number is required";
                          }
                          if (value.toString().trim().length != 10) {
                            return "Mobile number should be 10 digit";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Mobile No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.shopNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Shop name is required";
                          }
                          if (value.toString().trim().length < 3) {
                            return "Name should be atleast 3 Characters long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Shop name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.emailController,
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

                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: "State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                        items:
                            Constants.states
                                .map(
                                  (state) => DropdownMenuItem(
                                    value: state.toString(),
                                    child: Text(state.toString()),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          signupCubit.stateController.text = value.toString();
                        },
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.toString().trim().isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: signupCubit.confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.toString().trim().isEmpty) {
                            return "Cofirm Password is required";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.00),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      GestureDetector(
                        onTap: () async {
                          if (signupCubit.fromKey.currentState!.validate()) {
                            await signupCubit.signup();
                          }
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
                              "Sign Up",
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

                      SizedBox(height: 50),

                      Row(
                        children: [
                          Text("Already have an account?  "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
