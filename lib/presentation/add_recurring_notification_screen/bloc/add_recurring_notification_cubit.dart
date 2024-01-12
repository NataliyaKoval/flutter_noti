import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/use_cases/save_recurring_notification_use_case.dart';

part 'add_recurring_notification_state.dart';

class AddRecurringNotificationCubit
    extends Cubit<AddRecurringNotificationState> {
  AddRecurringNotificationCubit({
    required this.saveRecurringNotificationUseCase,
    required this.interval,
  }) : super(const AddRecurringNotificationState());

  final SaveRecurringNotificationUseCase saveRecurringNotificationUseCase;
  final int interval;

  void setMessage(String value) {
    emit(state.copyWith(message: value));
    _enableConfirmButton();
  }

  void _enableConfirmButton() {
    if (state.message.isNotEmpty) {
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
    RecurringNotification notification = RecurringNotification(
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      message: state.message,
      iconIdIndex: state.isIconChosen ? state.iconIndex : null,
      colorIndex: state.isIconChosen ? state.iconBackgroundIndex : null,
      interval: interval,
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.id,
        channelKey: 'recurring_channel',
        body: notification.message,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationInterval(interval: interval * 60, repeats: true),
    );

    await saveRecurringNotificationUseCase(notification);
    emit(state.copyWith(isConfirmed: true));
  }
}
