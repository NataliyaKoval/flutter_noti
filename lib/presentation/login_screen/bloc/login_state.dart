part of 'login_bloc.dart';

@immutable
class LoginState {
  const LoginState({
    required this.currentTime,
    this.isConfirmButtonEnabled = false,
    this.isConfirmed = false,
    this.isErrorVisible = false,
    this.hoursFirstDigit = space,
    this.hoursSecondDigit = space,
    this.minutesFirstDigit = space,
    this.minutesSecondDigit = space,
  });

  final String currentTime;
  final bool isConfirmButtonEnabled;
  final bool isConfirmed;
  final bool isErrorVisible;
  final String hoursFirstDigit;
  final String hoursSecondDigit;
  final String minutesFirstDigit;
  final String minutesSecondDigit;

  LoginState copyWith({
    String? currentTime,
    bool? isConfirmButtonEnabled,
    bool? isConfirmed,
    bool? isErrorVisible,
    String? hoursFirstDigit,
    String? hoursSecondDigit,
    String? minutesFirstDigit,
    String? minutesSecondDigit,
  }) {
    return LoginState(
      currentTime: currentTime ?? this.currentTime,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isErrorVisible: isErrorVisible ?? this.isErrorVisible,
      hoursFirstDigit: hoursFirstDigit ?? this.hoursFirstDigit,
      hoursSecondDigit: hoursSecondDigit ?? this.hoursSecondDigit,
      minutesFirstDigit: minutesFirstDigit ?? this.minutesFirstDigit,
      minutesSecondDigit: minutesSecondDigit ?? this.minutesSecondDigit,
    );
  }
}
