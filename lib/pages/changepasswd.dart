import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yara/pages/changepassword/cubit/changepassword_cubit.dart';
import 'package:yara/pages/login.dart';

class ChnagePassword extends StatefulWidget {
  const ChnagePassword({super.key});

  @override
  State<ChnagePassword> createState() => _ChnagePasswordState();
}

class _ChnagePasswordState extends State<ChnagePassword> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        backgroundColor: Colors.green.shade200,
      ),
      body: BlocConsumer<ChangepasswordCubit, ChangepasswordState>(
        listener: (context, state) async {
          if (state is ChangepasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password Change Successfull")),
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
            final pref = await SharedPreferences.getInstance();
            await pref.remove("isUserLoggedIn");
            await pref.remove('accessToken');
            await pref.remove('refreshToken');
          } else if (state is ChangepasswordFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is ChangepasswordLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final cubit = context.read<ChangepasswordCubit>();
          return Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: cubit.currentPasswordController,
                    validator: (value) {
                      if (value.toString().isEmpty || value == null) {
                        return "required field";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Current Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: cubit.newPasswordController,
                    validator: (value) {
                      if (value.toString().isEmpty || value == null) {
                        return "required field";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: cubit.confirmPasswordController,
                    validator: (value) {
                      if (value.toString().isEmpty || value == null) {
                        return "required field";
                      }
                      if (value.toString() !=
                          cubit.newPasswordController.text) {
                        return "New Password and Confirm Password doesnot Match";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () async {
                      // Handle password change logic
                      formKey.currentState!.validate();
                      await cubit.changePassword();
                    },
                    child: Text(
                      "Change Password",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
