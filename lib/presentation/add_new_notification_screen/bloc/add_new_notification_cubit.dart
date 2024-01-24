import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/consts/zero_width_space.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/get_saved_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_notification_use_case.dart';

part 'add_new_notification_state.dart';

class AddNewNotificationCubit extends Cubit<AddNewNotificationState> {
  AddNewNotificationCubit({
    required this.saveNotificationUseCase,
    required this.getSavedNotificationUseCase,
    this.id,
  }) : super(const AddNewNotificationState());

  final SaveNotificationUseCase saveNotificationUseCase;
  final GetSavedNotificationUseCase getSavedNotificationUseCase;
  final int? id;
  OneTimeNotification? savedNotification;

  void setMessage(String value) {
    emit(state.copyWith(message: value));
    _enableConfirmButton();
  }

  void setTime(TimeInputId id, String value) {
    String newValue = value;
    if (newValue == '') {
      newValue = zeroWidthSpace;
    }
    switch (id) {
      case TimeInputId.first:
        emit(state.copyWith(hoursFirstDigit: newValue));
        break;
      case TimeInputId.second:
        emit(state.copyWith(hoursSecondDigit: newValue));
        break;
      case TimeInputId.third:
        emit(state.copyWith(minutesFirstDigit: newValue));
        break;
      case TimeInputId.fourth:
        emit(state.copyWith(minutesSecondDigit: newValue));
        break;
    }
    _enableConfirmButton();
  }

  void _enableConfirmButton() {
    if (state.message.isNotEmpty &&
        state.hoursFirstDigit.length == 2 &&
        state.hoursSecondDigit.length == 2 &&
        state.minutesFirstDigit.length == 2 &&
        state.minutesSecondDigit.length == 2) {
      emit(state.copyWith(isConfirmButtonEnabled: true));
    } else {
      emit(state.copyWith(isConfirmButtonEnabled: false));
    }
  }

  void setIconBackground(int index) {
    emit(state.copyWith(iconBackgroundIndex: index));
  }

  void setIcon(int index) {
    emit(state.copyWith(iconIndex: index));
  }

  void displayIconData() {
    emit(state.copyWith(isIconChosen: true));
  }

  void createAndSaveNotification() async {
    DateTime now = DateTime.now();
    int hours = int.parse(
        '${state.hoursFirstDigit.substring(1)}${state.hoursSecondDigit.substring(1)}');
    int minutes = int.parse(
        '${state.minutesFirstDigit.substring(1)}${state.minutesSecondDigit.substring(1)}');
    DateTime time = DateTime(now.year, now.month, now.day, hours, minutes);

    OneTimeNotification notification = OneTimeNotification(
      id: savedNotification?.id ??
          DateTime.now().millisecondsSinceEpoch.remainder(10000),
      time: time,
      message: state.message,
      iconIdIndex: state.isIconChosen ? state.iconIndex : null,
      colorIndex: state.isIconChosen ? state.iconBackgroundIndex : null,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.id,
        channelKey: 'scheduled_channel',
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
        title: 'noti',
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

  void getSavedNotification() async {
    if (id != null) {
      savedNotification = await getSavedNotificationUseCase(id!);
      String? hours = savedNotification?.time.hour.toString().padLeft(2, '0');
      String? minutes =
          savedNotification?.time.minute.toString().padLeft(2, '0');
      emit(state.copyWith(
        message: savedNotification?.message,
        hoursFirstDigit: '$zeroWidthSpace${hours?[0]}',
        hoursSecondDigit: '$zeroWidthSpace${hours?[1]}',
        minutesFirstDigit: '$zeroWidthSpace${minutes?[0]}',
        minutesSecondDigit: '$zeroWidthSpace${minutes?[1]}',
        iconIndex: savedNotification?.iconIdIndex,
        iconBackgroundIndex: savedNotification?.colorIndex,
        isIconChosen: savedNotification?.iconIdIndex != null &&
            savedNotification?.colorIndex != null,
        isConfirmButtonEnabled: true,
      ));
    }
  }
}
