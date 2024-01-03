part of 'login_bloc.dart';

@immutable
class LoginState {
  const LoginState(
      {required this.currentTime, required this.isConfirmButtonActive});

  final String currentTime;
  final bool isConfirmButtonActive;
}
