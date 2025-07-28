import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:yara/pages/dashboard/Model/dashboardmodel.dart';
import 'package:yara/services/apiservices.dart';
import 'package:yara/services/interceptor/interceptor.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final _client = RestClient(Dio()..interceptors.add(AuthInterceptor()));
  DashboardCubit() : super(DashboardInitial());

  Future<dynamic> getBalance() async {
    emit(DashboardLoadingState());
    try {
      final response = await _client.dashoardData();
      emit(DashboardLoadedState(response));
    } catch (e) {
      emit(DashboardErrorState(e.toString()));
    }
  }
}
