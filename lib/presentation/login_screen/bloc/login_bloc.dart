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
      : super(LoginState(
          currentTime: DateFormat('hh:mm').format(DateTime.now()),
          isConfirmButtonActive: false,
        )) {
    _currentTimeSubscription = currentTime().listen(_onCurrentTimeTicked);
    on<CurrentTimeTickedEvent>(_setCurrentTime);
    on<InputChangedEvent>(_getTimeFromInput);
  }

  late final StreamSubscription _currentTimeSubscription;
  String formattedTime = '';
  String hoursFirstDigit = '';
  String hoursSecondDigit = '';
  String minutesFirstDigit = '';
  String minutesSecondDigit = '';
  String timeFromInput = '';
  bool isConfirmButtonActive = false;

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
    emit(LoginState(
      currentTime: event.currentTime,
      isConfirmButtonActive: isConfirmButtonActive,
    ));
  }

  Future<void> _getTimeFromInput(
      InputChangedEvent event, Emitter<LoginState> emit) async {
    switch (event.inputId) {
      case 'firstInput':
        hoursFirstDigit = event.inputValue;
        break;
      case 'secondInput':
        hoursSecondDigit = event.inputValue;
        break;
      case 'thirdInput':
        minutesFirstDigit = event.inputValue;
        break;
      case 'fourthInput':
        minutesSecondDigit = event.inputValue;
        break;
    }

    if (hoursFirstDigit.isNotEmpty &&
        hoursSecondDigit.isNotEmpty &&
        minutesFirstDigit.isNotEmpty &&
        minutesSecondDigit.isNotEmpty) {
      timeFromInput =
          '$hoursFirstDigit$hoursSecondDigit:$minutesFirstDigit$minutesSecondDigit';
      isConfirmButtonActive = true;
    } else {
      timeFromInput = '';
      isConfirmButtonActive = false;
    }
  }
}
