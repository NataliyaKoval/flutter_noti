import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/save_notification_use_case.dart';

part 'add_new_notification_state.dart';

class AddNewNotificationCubit extends Cubit<AddNewNotificationState> {
  AddNewNotificationCubit({required this.saveNotificationUseCase})
      : super(const AddNewNotificationState());

  final SaveNotificationUseCase saveNotificationUseCase;

  String message = '';
  String hoursFirstDigit = '';
  String hoursSecondDigit = '';
  String minutesFirstDigit = '';
  String minutesSecondDigit = '';

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
    if (message.isNotEmpty &&
        hoursFirstDigit.isNotEmpty &&
        hoursSecondDigit.isNotEmpty &&
        minutesFirstDigit.isNotEmpty &&
        minutesSecondDigit.isNotEmpty) {
      emit(state.copyWith(isConfirmButtonEnabled: true));
    } else {
      emit(state.copyWith(isConfirmButtonEnabled: false));
    }
  }

  void getIconBackground(int index) {
    emit(state.copyWith(iconBackgroundIndex: index));
  }

  void getIcon(int index) {
    emit(state.copyWith(iconIndex: index));
  }

  void displayIconData() {
    emit(state.copyWith(isIconChosen: true));
  }

  void createAndSaveNotification() async {
    DateTime now = DateTime.now();
    int hours = int.parse('$hoursFirstDigit$hoursSecondDigit');
    int minutes = int.parse('$minutesFirstDigit$minutesSecondDigit');
    DateTime time = DateTime(now.year, now.month, now.day, hours, minutes);

    OneTimeNotification notification = OneTimeNotification(
      id: createUniqueId(),
      time: time,
      message: message,
      iconIdIndex: state.isIconChosen ? state.iconIndex : null,
      colorIndex: state.isIconChosen ? state.iconBackgroundIndex : null,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: 'Reminder',
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
      ),
    );

    await saveNotificationUseCase(notification);
    emit(state.copyWith(isConfirmed: true));
  }

  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }
}