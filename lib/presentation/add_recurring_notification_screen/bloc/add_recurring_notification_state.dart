part of 'add_recurring_notification_cubit.dart';

@immutable
class AddRecurringNotificationState {
  const AddRecurringNotificationState({
    this.message = '',
    this.isConfirmButtonEnabled = false,
    this.iconIndex,
    this.iconBackgroundIndex,
    this.iconIndexPicker = 0,
    this.iconBackgroundIndexPicker = 0,
    this.isConfirmed = false,
    this.isNotificationsPermissionSnackBarShown = false,
  });

  final String message;
  final bool isConfirmButtonEnabled;
  final int? iconIndex;
  final int? iconBackgroundIndex;
  final int iconIndexPicker;
  final int iconBackgroundIndexPicker;
  final bool isConfirmed;
  final bool isNotificationsPermissionSnackBarShown;

  AddRecurringNotificationState copyWith({
    String? message,
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    int? iconIndexPicker,
    int? iconBackgroundIndexPicker,
    bool? isConfirmed,
    bool? isNotificationsPermissionSnackBarShown,
  }) {
    return AddRecurringNotificationState(
      message: message ?? this.message,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      iconIndexPicker: iconIndexPicker ?? this.iconIndexPicker,
      iconBackgroundIndexPicker:
          iconBackgroundIndexPicker ?? this.iconBackgroundIndexPicker,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isNotificationsPermissionSnackBarShown:
          isNotificationsPermissionSnackBarShown ??
              this.isNotificationsPermissionSnackBarShown,
    );
  }
}
