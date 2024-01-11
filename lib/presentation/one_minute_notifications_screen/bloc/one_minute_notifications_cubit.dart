import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/use_cases/get_recurring_notifications_use_case.dart';

part 'one_minute_notifications_state.dart';

class OneMinuteNotificationsCubit extends Cubit<OneMinuteNotificationsState> {
  OneMinuteNotificationsCubit({
    required this.getRecurringNotificationsUseCase,
  }) : super(const OneMinuteNotificationsState(oneMinuteNotifications: []));

  final GetRecurringNotificationsUseCase getRecurringNotificationsUseCase;

  void getOneMinuteNotifications() async {
    try {
      List<RecurringNotification> notifications =
          await getRecurringNotificationsUseCase(1);
      emit(state.copyWith(oneMinuteNotifications: notifications));
    } catch (e) {
      print(e);
    }
  }
}
