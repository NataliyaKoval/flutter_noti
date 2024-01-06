part of 'add_new_notification_cubit.dart';

@immutable
class AddNewNotificationState {
  const AddNewNotificationState({this.isConfirmButtonEnabled = false});

  final bool isConfirmButtonEnabled;

  AddNewNotificationState copyWith({
    bool? isConfirmButtonEnabled,
  }) {
    return AddNewNotificationState(
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
    );
  }
}
