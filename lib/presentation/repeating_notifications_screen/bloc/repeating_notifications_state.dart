part of 'repeating_notifications_cubit.dart';

@immutable
class RepeatingNotificationsState {
  const RepeatingNotificationsState({
    required this.notifications,
    // required this.interval,
  });

  final List<RecurringNotification> notifications;
  // final int interval;

  RepeatingNotificationsState copyWith({
    List<RecurringNotification>? notifications,
    // int? interval,
  }) {
    return RepeatingNotificationsState(
      notifications: notifications ?? this.notifications,
      // interval: interval ?? this.interval,
    );
  }
}
