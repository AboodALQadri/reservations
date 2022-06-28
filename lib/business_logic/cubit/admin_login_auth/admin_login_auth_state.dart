part of 'admin_login_auth_cubit.dart';

@immutable
abstract class AdminLoginAuthState {}

class AdminLoginAuthInitial extends AdminLoginAuthState {}

class Loading extends AdminLoginAuthState {}

class ErrorMsg extends AdminLoginAuthState {
  final String errorMsg;

  ErrorMsg({required this.errorMsg});
}


class AdminSubmitted extends AdminLoginAuthState{}
