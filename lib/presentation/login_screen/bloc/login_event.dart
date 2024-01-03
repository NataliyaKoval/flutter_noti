part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class CurrentTimeTickedEvent extends LoginEvent {
  CurrentTimeTickedEvent(this.currentTime);

  final String currentTime;
}

class InputChangedEvent extends LoginEvent {
  InputChangedEvent({
    required this.inputId,
    required this.inputValue,
  });

  final String inputId;
  final String inputValue;
}


