part of 'login_bloc.dart';

@immutable
class LoginState {
  const LoginState({
    required this.currentTime,
    this.isConfirmButtonEnabled = false,
    this.isConfirmed = false,
    this.isErrorVisible = false,
  });

  final String currentTime;
  final bool isConfirmButtonEnabled;
  final bool isConfirmed;
  final bool isErrorVisible;

  LoginState copyWith({
    String? currentTime,
    bool? isConfirmButtonEnabled,
    bool? isConfirmed,
    bool? isErrorVisible,
  }) {
    return LoginState(
      currentTime: currentTime ?? this.currentTime,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isErrorVisible: isErrorVisible ?? this.isErrorVisible,
    );
  }
}
