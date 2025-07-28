import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yara/pages/forgotpassword.dart';
import 'package:yara/pages/homepage.dart';
import 'package:yara/pages/login/cubit/login_cubit.dart';
import 'package:yara/pages/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
            }
            if (state is LoginErrorState) {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("Login Error"),
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
            final loginCubit = context.read<LoginCubit>();
            if (state is LoginLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.00, vertical: 85.00),
              child: Form(
                key: loginCubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Login To Your Account",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(fontSize: 28.00),
                      ),
                    ),

                    LottieBuilder.asset("assets/login.json"),

                    TextFormField(
                      controller: loginCubit.mobileController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value.toString().isEmpty || value == null) {
                          return "Mobile number is required";
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

                    SizedBox(height: 30),

                    TextFormField(
                      controller: loginCubit.passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value.toString().trim().isEmpty || value == null) {
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: loginCubit.isobscure,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginCubit.togglePasswordVisibility();
                          },
                          child:
                              loginCubit.isobscure
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(Icons.remove_red_eye_sharp),
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Forgotpassword(),
                              ),
                            );
                          },
                          child: Text(
                            "forgot password?",
                            textScaler: TextScaler.noScaling,
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    GestureDetector(
                      onTap: () async {
                        if (loginCubit.formKey.currentState!.validate()) {
                          await loginCubit.login();
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
                            "Login",
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
                        Text("Don't have an account?  "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(
                            "Sign Up",
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
          },
        ),
      ),
    );
  }
}
