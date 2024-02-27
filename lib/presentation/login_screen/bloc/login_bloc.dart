import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/consts/zero_width_space.dart';

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
    on<ConfirmButtonClickedEvent>(_verifyInputTime);
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
    String value = switch (event.inputValue) {
      '' => zeroWidthSpace,
      _ => event.inputValue
    };
    switch (event.inputId) {
      case TimeInputId.first:
        emit(state.copyWith(hoursFirstDigit: value));
        break;
      case TimeInputId.second:
        emit(state.copyWith(hoursSecondDigit: value));
        break;
      case TimeInputId.third:
        emit(state.copyWith(minutesFirstDigit: value));
        break;
      case TimeInputId.fourth:
        emit(state.copyWith(minutesSecondDigit: value));
        break;
    }

    if (state.hoursFirstDigit.length == 2 &&
        state.hoursSecondDigit.length == 2 &&
        state.minutesFirstDigit.length == 2 &&
        state.minutesSecondDigit.length == 2) {
      emit(state.copyWith(isConfirmButtonEnabled: true));
    } else {
      emit(
          state.copyWith(isConfirmButtonEnabled: false, isErrorVisible: false));
    }
  }

  Future<void> _verifyInputTime(
      ConfirmButtonClickedEvent event, Emitter<LoginState> emit) async {
    String hoursFirstDigit = state.hoursFirstDigit.substring(1);
    String hoursSecondDigit = state.hoursSecondDigit.substring(1);
    String minutesFirstDigit = state.minutesFirstDigit.substring(1);
    String minutesSecondDigit = state.minutesSecondDigit.substring(1);

    if (formattedTime ==
        '$hoursFirstDigit$hoursSecondDigit:$minutesFirstDigit$minutesSecondDigit') {
      emit(state.copyWith(isVerified: true));
    } else {
      emit(state.copyWith(
        isErrorVisible: true,
        hoursFirstDigit: zeroWidthSpace,
        hoursSecondDigit: zeroWidthSpace,
        minutesFirstDigit: zeroWidthSpace,
        minutesSecondDigit: zeroWidthSpace,
      ));
    }
  }
}
