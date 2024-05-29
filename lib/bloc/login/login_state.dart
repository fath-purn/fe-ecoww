part of 'login_cubit.dart';

// @immutable
// abstract class RegisterLoginState {}

// class RegisterLoginInitial extends RegisterLoginState {}

// class RegisterLoginLoading extends RegisterLoginState {}

// class RegisterLoginSuccess extends RegisterLoginState {
//   final String msg;
//   RegisterLoginSuccess(this.msg);
// }

// class RegisterLoginFailure extends RegisterLoginState {
//   final String msg;
//   RegisterLoginFailure(this.msg);
// }

// // login_state.dart
// part of 'register_login_cubit.dart';

@immutable
abstract class RegisterLoginState {}

class RegisterLoginInitial extends RegisterLoginState {}

class RegisterLoginLoading extends RegisterLoginState {}

class RegisterLoginSuccess extends RegisterLoginState {
  final String msg;
  RegisterLoginSuccess(this.msg);
}

class RegisterLoginFailure extends RegisterLoginState {
  final String msg;
  RegisterLoginFailure(this.msg);
}
