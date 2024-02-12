import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/consts/zero_width_space.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/get_saved_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_notification_use_case.dart';
import 'package:permission_handler/permission_handler.dart';

part 'add_new_notification_state.dart';

class AddNewNotificationCubit extends Cubit<AddNewNotificationState> {
  AddNewNotificationCubit({
    required this.saveNotificationUseCase,
    required this.getSavedNotificationUseCase,
    this.savedNotificationId,
  }) : super(const AddNewNotificationState());

  final SaveNotificationUseCase saveNotificationUseCase;
  final GetSavedNotificationUseCase getSavedNotificationUseCase;
  final int? savedNotificationId;
  OneTimeNotification? savedNotification;

  void setMessage(String value) {
    emit(state.copyWith(message: value));
    _validateInputs();
  }

  void setTime(TimeInputId id, String value) {
    String newValue = switch (value) { '' => zeroWidthSpace, _ => value };

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
    _validateInputs();
  }

  void _validateInputs() {
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

  void setIconBackgroundIndexPicker(int index) {
    emit(state.copyWith(iconBackgroundIndexPicker: index));
  }

  void setIconIndexPicker(int index) {
    emit(state.copyWith(iconIndexPicker: index));
  }

  void setIconAndBackground() {
    emit(state.copyWith(
      iconIndex: state.iconIndexPicker,
      iconBackgroundIndex: state.iconBackgroundIndexPicker,
    ));
  }

  void onNotificationsPermissionSnackBarHidden() {
    emit(state.copyWith(isNotificationsPermissionSnackBarShown: false));
  }

  void createAndSaveNotification() async {
    if (!await Permission.notification.request().isGranted) {
      emit(state.copyWith(isNotificationsPermissionSnackBarShown: true));
      return;
    }

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
      iconIdIndex: state.iconIndex,
      colorIndex: state.iconBackgroundIndex,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.id,
        channelKey: 'scheduled_channel',
        //Todo class NotiChannels + static prop
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
        title: 'noti',
        //todo
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
        preciseAlarm: true,
      ),
    );

    await saveNotificationUseCase(notification);
    emit(state.copyWith(isConfirmed: true)); //Todo try catch
  }

  void getSavedNotification() async {
    if (savedNotificationId == null) {
      return;
    }
    savedNotification = await getSavedNotificationUseCase(savedNotificationId!); //Todo return if null
    String? hours = savedNotification?.time.hour.toString().padLeft(2, '0');
    String? minutes = savedNotification?.time.minute.toString().padLeft(2, '0');
    emit(state.copyWith(
      message: savedNotification?.message,
      hoursFirstDigit: '$zeroWidthSpace${hours?[0]}',
      hoursSecondDigit: '$zeroWidthSpace${hours?[1]}',
      minutesFirstDigit: '$zeroWidthSpace${minutes?[0]}',
      minutesSecondDigit: '$zeroWidthSpace${minutes?[1]}',
      iconIndex: savedNotification?.iconIdIndex,
      iconBackgroundIndex: savedNotification?.colorIndex,
      iconIndexPicker: savedNotification?.iconIdIndex,
      iconBackgroundIndexPicker: savedNotification?.colorIndex,
      isConfirmButtonEnabled: true,
    ));
  }
}
