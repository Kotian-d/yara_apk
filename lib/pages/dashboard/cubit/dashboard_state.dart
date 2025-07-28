part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoadingState extends DashboardState {}

final class DashboardLoadedState extends DashboardState {
  final DashboardData response;
  DashboardLoadedState(this.response);
}

final class DashboardErrorState extends DashboardState {
  final String message;
  DashboardErrorState(this.message);
}
