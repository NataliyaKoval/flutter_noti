import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/use_cases/get_recurring_notifications_use_case.dart';

part 'repeating_notifications_state.dart';

class RepeatingNotificationsCubit extends Cubit<RepeatingNotificationsState> {
  RepeatingNotificationsCubit({
    required this.getRecurringNotificationsUseCase,
    required this.interval,
  }) : super(const RepeatingNotificationsState(notifications: []));

  final GetRecurringNotificationsUseCase getRecurringNotificationsUseCase;
  final int interval;

  void getNotifications() async {
    try {
      List<RecurringNotification> notifications =
          await getRecurringNotificationsUseCase(interval);
      emit(state.copyWith(notifications: notifications));
    } catch (e) {
      print(e);
    }
  }

  void removeNotification(int id) {
    //TODO
    //removeOneTimeNotificationUseCase(id);
    AwesomeNotifications().cancelSchedule(id);
    emit(state.copyWith(
        notifications: List.of(state.notifications)
          ..removeWhere((element) => element.id == id)));
  }
}
