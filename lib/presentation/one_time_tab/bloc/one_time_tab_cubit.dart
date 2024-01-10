import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_one_time_notification_use_case.dart';

part 'one_time_tab_state.dart';

class OneTimeTabCubit extends Cubit<OneTimeTabState> {
  OneTimeTabCubit({
    required this.getOneTimeNotificationsUseCase,
    required this.removeOneTimeNotificationUseCase,
  }) : super(const OneTimeTabState(list: []));

  final GetOneTimeNotificationsUseCase getOneTimeNotificationsUseCase;
  final RemoveOneTimeNotificationUseCase removeOneTimeNotificationUseCase;

  void getOneTimeNotifications() async {
    try {
      List<OneTimeNotification> list = await getOneTimeNotificationsUseCase();
      emit(state.copyWith(list: list));
    } catch (e) {
      print(e);
    }
  }

  void removeOneTimeNotification(int id) {
    removeOneTimeNotificationUseCase(id);
    emit(state.copyWith(list: List.of(state.list)..removeWhere((element) => element.id == id)));
  }
}

