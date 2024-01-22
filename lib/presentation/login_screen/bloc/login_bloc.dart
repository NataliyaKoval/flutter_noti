import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noti/consts/time_input_id.dart';

part 'login_event.dart';

part 'login_state.dart';

Stream<DateTime> currentTime() =>
    Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
          currentTime: DateFormat('HH:mm').format(DateTime.now()),
        )) {
    _currentTimeSubscription = currentTime().listen(_onCurrentTimeTicked);
    on<CurrentTimeTickedEvent>(_setCurrentTime);
    on<InputChangedEvent>(_setTimeFromInput);
    on<ConfirmButtonClickedEvent>(_compareCurrentTimeAndInputTime);
  }

  late final StreamSubscription _currentTimeSubscription;
  String formattedTime = '';

  void _onCurrentTimeTicked(DateTime dateTime) {
    formattedTime = DateFormat('HH:mm').format(dateTime);
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

  Future<void> _setTimeFromInput(
      InputChangedEvent event, Emitter<LoginState> emit) async {
    switch (event.inputId) {
      case TimeInputId.first:
        emit(state.copyWith(hoursFirstDigit: event.inputValue));
        break;
      case TimeInputId.second:
        emit(state.copyWith(hoursSecondDigit: event.inputValue));
        break;
      case TimeInputId.third:
        emit(state.copyWith(minutesFirstDigit: event.inputValue));
        break;
      case TimeInputId.fourth:
        emit(state.copyWith(minutesSecondDigit: event.inputValue));
        break;
    }

    if (state.hoursFirstDigit.isNotEmpty &&
        state.hoursSecondDigit.isNotEmpty &&
        state.minutesFirstDigit.isNotEmpty &&
        state.minutesSecondDigit.isNotEmpty) {
      emit(state.copyWith(isConfirmButtonEnabled: true));
    } else {
      emit(
          state.copyWith(isConfirmButtonEnabled: false, isErrorVisible: false));
    }
  }

  Future<void> _compareCurrentTimeAndInputTime(
      ConfirmButtonClickedEvent event, Emitter<LoginState> emit) async {
    if (formattedTime ==
        '${state.hoursFirstDigit}${state.hoursSecondDigit}:${state.minutesFirstDigit}${state.minutesSecondDigit}') {
      emit(state.copyWith(isConfirmed: true));
    } else {
      emit(state.copyWith(
        isErrorVisible: true,
        hoursFirstDigit: '',
        hoursSecondDigit: '',
        minutesFirstDigit: '',
        minutesSecondDigit: '',
      ));
    }
  }
}
