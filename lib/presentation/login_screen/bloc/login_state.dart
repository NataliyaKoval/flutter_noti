part of 'login_bloc.dart';

@immutable
class LoginState {
  const LoginState({
    required this.currentTime,
    this.isConfirmButtonEnabled = false,
    this.isVerified = false,
    this.isErrorVisible = false,
    this.hoursFirstDigit = zeroWidthSpace,
    this.hoursSecondDigit = zeroWidthSpace,
    this.minutesFirstDigit = zeroWidthSpace,
    this.minutesSecondDigit = zeroWidthSpace,
  });

  final String currentTime;
  final bool isConfirmButtonEnabled;
  final bool isVerified;
  final bool isErrorVisible;
  final String hoursFirstDigit;
  final String hoursSecondDigit;
  final String minutesFirstDigit;
  final String minutesSecondDigit;

  LoginState copyWith({
    String? currentTime,
    bool? isConfirmButtonEnabled,
    bool? isVerified,
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
      isVerified: isVerified ?? this.isVerified,
      isErrorVisible: isErrorVisible ?? this.isErrorVisible,
      hoursFirstDigit: hoursFirstDigit ?? this.hoursFirstDigit,
      hoursSecondDigit: hoursSecondDigit ?? this.hoursSecondDigit,
      minutesFirstDigit: minutesFirstDigit ?? this.minutesFirstDigit,
      minutesSecondDigit: minutesSecondDigit ?? this.minutesSecondDigit,
    );
  }
}
