part of 'add_new_notification_cubit.dart';

@immutable
class AddNewNotificationState {
  const AddNewNotificationState({
    this.isConfirmButtonEnabled = false,
    this.iconIndex = 0,
  });

  final bool isConfirmButtonEnabled;
  final int iconIndex;

  AddNewNotificationState copyWith({
    bool? isConfirmButtonEnabled,
    int? iconIndex,
  }) {
    return AddNewNotificationState(
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
    );
  }
}
