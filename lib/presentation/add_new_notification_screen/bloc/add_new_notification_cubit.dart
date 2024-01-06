import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/time_input_id.dart';

part 'add_new_notification_state.dart';

class AddNewNotificationCubit extends Cubit<AddNewNotificationState> {
  AddNewNotificationCubit() : super(const AddNewNotificationState());

  String message = '';
  String hoursFirstDigit = '';
  String hoursSecondDigit = '';
  String minutesFirstDigit = '';
  String minutesSecondDigit = '';
  IconData? icon;
  Color? iconBackground;

  void getMessage(String value) {
    message = value;
    _enableConfirmButton();
  }

  void getTime(TimeInputId id, String value) {
    switch (id) {
      case TimeInputId.first:
        hoursFirstDigit = value;
        break;
      case TimeInputId.second:
        hoursSecondDigit = value;
        break;
      case TimeInputId.third:
        minutesFirstDigit = value;
        break;
      case TimeInputId.fourth:
        minutesSecondDigit = value;
        break;
    }
    _enableConfirmButton();
  }

  void _enableConfirmButton() {
    if (message.isNotEmpty && hoursFirstDigit.isNotEmpty &&
        hoursSecondDigit.isNotEmpty && minutesFirstDigit.isNotEmpty &&
        minutesSecondDigit.isNotEmpty) {
      emit(state.copyWith(isConfirmButtonEnabled: true));
      // DateTime now = DateTime.now();
      // int hours = int.parse('$hoursFirstDigit$hoursSecondDigit');
      // int minutes = int.parse('$minutesFirstDigit$minutesSecondDigit');
      // DateTime time = DateTime(now.year, now.month, now.day, hours, minutes);
      // print(time);
    } else {
      emit(state.copyWith(isConfirmButtonEnabled: false));
    }
  }

  void getIconBackground(value) {
    iconBackground = value;
    print(iconBackground);
  }
}
