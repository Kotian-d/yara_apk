import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yara/pages/login/Model/userloginmodel.dart';
import 'package:yara/services/apiservices.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _client = RestClient(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    ),
  );
  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isobscure = true;
  LoginCubit() : super(LoginInitial());

  void togglePasswordVisibility() {
    isobscure = !isobscure;
    emit(LoginInitial()); // Emit initial state to rebuild the UI
  }

  Future<void> login() async {
    try {
      emit(LoginLoadingState());
      final token = await _client.loginUser(
        UsersLoginModel(
          mobile: mobileController.text,
          password: passwordController.text,
        ),
      );
      final pref = await SharedPreferences.getInstance();
      await pref.setBool("isUserLoggedIn", true);
      await pref.setString("refreshToken", token.refreshToken);
      await pref.setString("accessToken", token.accessToken);

      formKey.currentState?.reset();
      emit(LoginSuccessState());
    } on Exception catch (e) {
      switch (e.runtimeType) {
        case const (DioException):
          final dioError = e as DioException;
          if (dioError.response!.statusCode! >= 400 &&
              dioError.response!.statusCode! < 500) {
            emit(LoginErrorState(dioError.response?.data["message"]));
          } else {
            emit(LoginErrorState("An unexpected error occurred"));
          }
          break;
      }
    }
  }
}
