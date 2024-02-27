import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/notification_channels.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/use_cases/get_saved_recurring_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_recurring_notification_use_case.dart';
import 'package:noti/utils/create_notification_id.dart';
import 'package:permission_handler/permission_handler.dart';

part 'add_recurring_notification_state.dart';

class AddRecurringNotificationCubit
    extends Cubit<AddRecurringNotificationState> {
  AddRecurringNotificationCubit({
    required this.saveRecurringNotificationUseCase,
    required this.getSavedRecurringNotificationUseCase,
    required this.intervalMinutes,
    this.savedNotificationId,
  }) : super(const AddRecurringNotificationState());

  final SaveRecurringNotificationUseCase saveRecurringNotificationUseCase;
  final GetSavedRecurringNotificationUseCase
      getSavedRecurringNotificationUseCase;
  final int intervalMinutes;
  final int? savedNotificationId;
  RecurringNotification? savedNotification;

  void setMessage(String value) {
    emit(state.copyWith(message: value));
    _validateInput();
  }

  void _validateInput() {
    emit(state.copyWith(isConfirmButtonEnabled: state.message.isNotEmpty));
  }

  void setIconBackgroundIndexPicker(int index) {
    emit(state.copyWith(iconBackgroundIndexPicker: index));
  }

  void setIconIndexPicker(int index) {
    emit(state.copyWith(iconIndexPicker: index));
  }

  void applySelectedIconAndBackground() {
    emit(state.copyWith(
      iconIndex: state.iconIndexPicker,
      iconBackgroundIndex: state.iconBackgroundIndexPicker,
    ));
  }

  void createAndSaveNotification() async {
    if (!await Permission.notification.request().isGranted) {
      emit(state.copyWith(isNotificationsPermissionSnackBarShown: true));
      return;
    }
    RecurringNotification notification = RecurringNotification(
      id: savedNotification?.id ?? createNotificationId(),
      message: state.message,
      iconIdIndex: state.iconIndex,
      colorIndex: state.iconBackgroundIndex,
      interval: intervalMinutes,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.id,
        channelKey: NotificationChannels.recurringChannel,
        title: Strings.appStrings.appName,
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationInterval(
        interval: intervalMinutes * 60,
        repeats: true,
        preciseAlarm: true,
      ),
    );

    try {
      await saveRecurringNotificationUseCase(notification);
      emit(state.copyWith(isConfirmed: true));
    } catch (e) {
      emit(state.copyWith(isErrorSnackBarShown: true));
    }
  }

  void onNotificationsPermissionSnackBarHidden() {
    emit(state.copyWith(isNotificationsPermissionSnackBarShown: false));
  }

  void onErrorSnackBarHidden() {
    emit(state.copyWith(isErrorSnackBarShown: false));
  }

  void getSavedNotification() async {
    if (savedNotificationId == null) {
      return;
    }

    try {
      savedNotification =
          await getSavedRecurringNotificationUseCase(savedNotificationId!);
    } catch (e) {
      emit(state.copyWith(isErrorSnackBarShown: true));
    }

    if (savedNotification == null) {
      return;
    }

    emit(state.copyWith(
      message: savedNotification?.message,
      iconIndex: savedNotification?.iconIdIndex,
      iconBackgroundIndex: savedNotification?.colorIndex,
      iconIndexPicker: savedNotification?.iconIdIndex,
      iconBackgroundIndexPicker: savedNotification?.colorIndex,
      isConfirmButtonEnabled: true,
    ));
  }
}
