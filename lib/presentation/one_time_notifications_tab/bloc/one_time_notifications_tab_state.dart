part of 'one_time_notifications_tab_cubit.dart';

@immutable
class OneTimeNotificationsTabState {
  const OneTimeNotificationsTabState({
    required this.list,
  });

  final List<OneTimeNotification> list;

  OneTimeNotificationsTabState copyWith({
    List<OneTimeNotification>? list,
  }) {
    return OneTimeNotificationsTabState(
      list: list ?? this.list,
    );
  }
}
