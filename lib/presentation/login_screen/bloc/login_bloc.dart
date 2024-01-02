import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'login_event.dart';

part 'login_state.dart';

Stream<DateTime> currentTime() =>
    Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginInitial(
            currentTime: DateFormat('hh:mm').format(DateTime.now()))) {
    _currentTimeSubscription = currentTime().listen(_onCurrentTimeTicked);
    on<CurrentTimeTickedEvent>(_setCurrentTime);
  }

  late final StreamSubscription _currentTimeSubscription;
  String formattedTime = '';

  void _onCurrentTimeTicked(DateTime dateTime) {
    formattedTime = DateFormat('hh:mm').format(dateTime);
    add(CurrentTimeTickedEvent(formattedTime));
  }

  @override
  Future<void> close() {
    _currentTimeSubscription.cancel();
    return super.close();
  }

  Future<void> _setCurrentTime(
      CurrentTimeTickedEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitial(currentTime: event.currentTime));
  }
}
