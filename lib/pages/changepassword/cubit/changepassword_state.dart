part of 'changepassword_cubit.dart';

@immutable
sealed class ChangepasswordState {}

final class ChangepasswordInitial extends ChangepasswordState {}

final class ChangepasswordLoading extends ChangepasswordState {}

final class ChangepasswordSuccess extends ChangepasswordState {
  final ResponseModel response;
  ChangepasswordSuccess(this.response);
}

final class ChangepasswordFailure extends ChangepasswordState {
  final String error;

  ChangepasswordFailure(this.error);
}
