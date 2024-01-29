part of 'add_new_notification_cubit.dart';

@immutable
class AddNewNotificationState {
  const AddNewNotificationState({
    this.message = '',
    this.isConfirmButtonEnabled = false,
    this.iconIndex = 0,
    this.iconBackgroundIndex = 0,
    this.isIconChosen = false,
    this.isConfirmed = false,
    this.hoursFirstDigit = zeroWidthSpace,
    this.hoursSecondDigit = zeroWidthSpace,
    this.minutesFirstDigit = zeroWidthSpace,
    this.minutesSecondDigit = zeroWidthSpace,
    this.isNotificationsPermissionSnackBarShown = false,
  });

  final String message;
  final bool isConfirmButtonEnabled;
  final int iconIndex;
  final int iconBackgroundIndex;
  final bool isIconChosen;
  final bool isConfirmed;
  final String hoursFirstDigit;
  final String hoursSecondDigit;
  final String minutesFirstDigit;
  final String minutesSecondDigit;
  final bool isNotificationsPermissionSnackBarShown;

  AddNewNotificationState copyWith({
    String? message,
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    bool? isIconChosen,
    bool? isConfirmed,
    String? hoursFirstDigit,
    String? hoursSecondDigit,
    String? minutesFirstDigit,
    String? minutesSecondDigit,
    bool? isNotificationsPermissionSnackBarShown,
  }) {
    return AddNewNotificationState(
      message: message ?? this.message,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      isIconChosen: isIconChosen ?? this.isIconChosen,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      hoursFirstDigit: hoursFirstDigit ?? this.hoursFirstDigit,
      hoursSecondDigit: hoursSecondDigit ?? this.hoursSecondDigit,
      minutesFirstDigit: minutesFirstDigit ?? this.minutesFirstDigit,
      minutesSecondDigit: minutesSecondDigit ?? this.minutesSecondDigit,
      isNotificationsPermissionSnackBarShown:
          isNotificationsPermissionSnackBarShown ??
              this.isNotificationsPermissionSnackBarShown,
    );
  }
}
