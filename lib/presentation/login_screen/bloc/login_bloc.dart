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
        )) {
    _currentTimeSubscription = currentTime().listen(_onCurrentTimeTicked);
    on<CurrentTimeTickedEvent>(_setCurrentTime);
    on<InputChangedEvent>(_getTimeFromInput);
    on<ConfirmButtonClickedEvent>(_compareCurrentTimeAndInputTime);
  }

  late final StreamSubscription _currentTimeSubscription;
  String formattedTime = '';
  String hoursFirstDigit = '';
  String hoursSecondDigit = '';
  String minutesFirstDigit = '';
  String minutesSecondDigit = '';
  String inputTime = '';

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
    emit(state.copyWith(currentTime: event.currentTime));
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
      inputTime =
          '$hoursFirstDigit$hoursSecondDigit:$minutesFirstDigit$minutesSecondDigit';
      emit(state.copyWith(isConfirmButtonActive: true));
    } else {
      inputTime = '';
      emit(state.copyWith(isConfirmButtonActive: false));
    }
  }

  Future<void> _compareCurrentTimeAndInputTime(
      ConfirmButtonClickedEvent event, Emitter<LoginState> emit) async {
    if (formattedTime == inputTime) {
      emit(state.copyWith(isConfirmed: true));
    } else {
      emit(state.copyWith(isErrorVisible: true));
    }
  }
}
