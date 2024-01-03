part of 'login_bloc.dart';

@immutable
class LoginState {
  const LoginState({
    required this.currentTime,
    this.isConfirmButtonActive = false,
    this.isConfirmed = false,
    this.isErrorVisible = false,
  });

  final String currentTime;
  final bool isConfirmButtonActive;
  final bool isConfirmed;
  final bool isErrorVisible;

  LoginState copyWith({
    String? currentTime,
    bool? isConfirmButtonActive,
    bool? isConfirmed,
    bool? isErrorVisible,
  }) {
    return LoginState(
      currentTime: currentTime ?? this.currentTime,
      isConfirmButtonActive:
          isConfirmButtonActive ?? this.isConfirmButtonActive,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isErrorVisible: isErrorVisible ?? this.isErrorVisible,
    );
  }
}
