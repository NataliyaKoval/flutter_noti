part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial({required this.currentTime});

  final String currentTime;
}
