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
  });

  final String message;
  final bool isConfirmButtonEnabled;
  final int iconIndex;
  final int iconBackgroundIndex;
  final bool isIconChosen;
  final bool isConfirmed;

  AddRecurringNotificationState copyWith({
    String? message,
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    bool? isIconChosen,
    bool? isConfirmed,
  }) {
    return AddRecurringNotificationState(
      message: message ?? this.message,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      isIconChosen: isIconChosen ?? this.isIconChosen,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }
}