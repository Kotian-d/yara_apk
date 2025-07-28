import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yara/pages/changepassword/model/changepasswordmodel.dart';
import 'package:yara/pages/model/responsemodel.dart';
import 'package:yara/services/apiservices.dart';
import 'package:yara/services/interceptor/interceptor.dart';

part 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  final _client = RestClient(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    )..interceptors.add(AuthInterceptor()),
  );
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  ChangepasswordCubit() : super(ChangepasswordInitial());

  Future<void> changePassword() async {
    emit(ChangepasswordLoading());
    try {
      // Simulate a network call
      final response = await _client.changePassword(
        ChangePasswordModel(
          currentpassword: currentPasswordController.text,
          newpassword: newPasswordController.text,
          confirmpassword: confirmPasswordController.text,
        ),
      );
      emit(ChangepasswordSuccess(response));
    } on Exception catch (e) {
      switch (e.runtimeType) {
        case const (TimeoutException):
          emit(ChangepasswordFailure("Request timed out. Please try again."));
          break;
        case const (SocketException):
          emit(ChangepasswordFailure("No internet connection."));
          break;
      }
      // If there is an error, emit failure state
      emit(ChangepasswordFailure(e.toString()));
    }
  }
}
