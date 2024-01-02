part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class CurrentTimeTickedEvent extends LoginEvent {
  CurrentTimeTickedEvent(this.currentTime);

  final String currentTime;
}
