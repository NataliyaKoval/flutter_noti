import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/use_cases/get_saved_recurring_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_recurring_notification_use_case.dart';
import 'package:permission_handler/permission_handler.dart';

part 'add_recurring_notification_state.dart';

class AddRecurringNotificationCubit
    extends Cubit<AddRecurringNotificationState> {
  AddRecurringNotificationCubit({
    required this.saveRecurringNotificationUseCase,
    required this.getSavedRecurringNotificationUseCase,
    required this.interval,
    this.id,
  }) : super(const AddRecurringNotificationState());

  final SaveRecurringNotificationUseCase saveRecurringNotificationUseCase;
  final GetSavedRecurringNotificationUseCase
      getSavedRecurringNotificationUseCase;
  final int interval;
  final int? id;
  RecurringNotification? savedNotification;

  void setMessage(String value) {
    emit(state.copyWith(message: value));
    _validateInput();
  }

  void _validateInput() {
    if (state.message.isNotEmpty) {
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

  void createAndSaveNotification() async {
    if (!await Permission.notification.request().isGranted) {
      emit(state.copyWith(isNotificationsPermissionSnackBarShown: true));
      return;
    }
    RecurringNotification notification = RecurringNotification(
      id: savedNotification?.id ??
          DateTime.now().millisecondsSinceEpoch.remainder(100000),
      message: state.message,
      iconIdIndex: state.iconIndex,
      colorIndex: state.iconBackgroundIndex,
      interval: interval,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.id,
        channelKey: 'recurring_channel',
        title: 'noti',
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationInterval(
        interval: interval * 60,
        repeats: true,
        preciseAlarm: true,
      ),
    );

    await saveRecurringNotificationUseCase(notification);
    emit(state.copyWith(isConfirmed: true));
  }

  void getSavedNotification() async {
    if (id != null) {
      savedNotification = await getSavedRecurringNotificationUseCase(id!);
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
}
