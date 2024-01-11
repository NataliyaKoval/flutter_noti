part of 'one_minute_notifications_cubit.dart';

@immutable
class OneMinuteNotificationsState {
  final List<RecurringNotification> oneMinuteNotifications;

  const OneMinuteNotificationsState({
    required this.oneMinuteNotifications,
  });

  OneMinuteNotificationsState copyWith({
    List<RecurringNotification>? oneMinuteNotifications,
  }) {
    return OneMinuteNotificationsState(
      oneMinuteNotifications:
          oneMinuteNotifications ?? this.oneMinuteNotifications,
    );
  }
}
