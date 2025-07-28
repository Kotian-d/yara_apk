import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yara/pages/signup/Model/signupmodel.dart';
import 'package:yara/services/apiservices.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final _client = RestClient(Dio());
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isobscure = true;
  SignupCubit() : super(SignupInitial()) {
    // Optionally, assign the same key to fromKey if needed elsewhere
  }

  void togglePasswordVisibility() {
    isobscure = !isobscure;
    emit(SignupInitial()); // Emit initial state to rebuild the UI
  }

  Future<void> signup() async {
    try {
      emit(SignupLoadingState());
      // Simulate a network call
      final response = await _client.signup(
        SignUpModel(
          name: nameController.text,
          mobile: mobileController.text,
          email: emailController.text,
          shopname: shopNameController.text,
          state: stateController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      );
      fromKey.currentState?.reset();
      emit(SignupSuccessState(response.message));
    } on Exception catch (e) {
      switch (e.runtimeType) {
        case const (DioException):
          final dioError = e as DioException;
          if (dioError.response?.statusCode == 400) {
            emit(
              SignupErrorState(
                dioError.response?.data['message'] ?? "Invalid input data",
              ),
            );
          } else if (dioError.response?.statusCode == 500) {
            emit(
              SignupErrorState(
                dioError.response?.data['message'] ?? "Server error",
              ),
            );
          } else {
            emit(SignupErrorState("Network error: ${dioError.message}"));
          }
          break;
      }
    }
  }
}
