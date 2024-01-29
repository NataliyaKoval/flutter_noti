part of 'add_recurring_notification_cubit.dart';

@immutable
class AddRecurringNotificationState {
  const AddRecurringNotificationState({
    this.message = '',
    this.isConfirmButtonEnabled = false,
    this.iconIndex = 0,
    this.iconBackgroundIndex = 0,
    this.isIconChosen = false,
    this.isConfirmed = false,
    this.isNotificationsPermissionSnackBarShown = false,
  });

  final String message;
  final bool isConfirmButtonEnabled;
  final int iconIndex;
  final int iconBackgroundIndex;
  final bool isIconChosen;
  final bool isConfirmed;
  final bool isNotificationsPermissionSnackBarShown;

  AddRecurringNotificationState copyWith({
    String? message,
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    bool? isIconChosen,
    bool? isConfirmed,
    bool? isNotificationsPermissionSnackBarShown,
  }) {
    return AddRecurringNotificationState(
      message: message ?? this.message,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      isIconChosen: isIconChosen ?? this.isIconChosen,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isNotificationsPermissionSnackBarShown:
          isNotificationsPermissionSnackBarShown ??
              this.isNotificationsPermissionSnackBarShown,
    );
  }
}
