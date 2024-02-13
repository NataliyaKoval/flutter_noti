part of 'add_new_notification_cubit.dart';

@immutable
class AddNewNotificationState {
  const AddNewNotificationState({
    this.message = '',
    this.isConfirmButtonEnabled = false,
    this.iconIndex,
    this.iconBackgroundIndex,
    this.iconIndexPicker = 0,
    this.iconBackgroundIndexPicker = 0,
    this.isConfirmed = false,
    this.hoursFirstDigit = zeroWidthSpace,
    this.hoursSecondDigit = zeroWidthSpace,
    this.minutesFirstDigit = zeroWidthSpace,
    this.minutesSecondDigit = zeroWidthSpace,
    this.isNotificationsPermissionSnackBarShown = false,
    this.isErrorSnackBarShown = false,
  });

  final String message;
  final bool isConfirmButtonEnabled;
  final int? iconIndex;
  final int? iconBackgroundIndex;
  final int iconIndexPicker;
  final int iconBackgroundIndexPicker;
  final bool isConfirmed;
  final String hoursFirstDigit;
  final String hoursSecondDigit;
  final String minutesFirstDigit;
  final String minutesSecondDigit;
  final bool isNotificationsPermissionSnackBarShown;
  final bool isErrorSnackBarShown;

  AddNewNotificationState copyWith({
    String? message,
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    int? iconIndexPicker,
    int? iconBackgroundIndexPicker,
    bool? isConfirmed,
    String? hoursFirstDigit,
    String? hoursSecondDigit,
    String? minutesFirstDigit,
    String? minutesSecondDigit,
    bool? isNotificationsPermissionSnackBarShown,
    bool? isErrorSnackBarShown,
  }) {
    return AddNewNotificationState(
      message: message ?? this.message,
      isConfirmButtonEnabled:
          isConfirmButtonEnabled ?? this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      iconIndexPicker: iconIndexPicker ?? this.iconIndexPicker,
      iconBackgroundIndexPicker:
          iconBackgroundIndexPicker ?? this.iconBackgroundIndexPicker,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      hoursFirstDigit: hoursFirstDigit ?? this.hoursFirstDigit,
      hoursSecondDigit: hoursSecondDigit ?? this.hoursSecondDigit,
      minutesFirstDigit: minutesFirstDigit ?? this.minutesFirstDigit,
      minutesSecondDigit: minutesSecondDigit ?? this.minutesSecondDigit,
      isNotificationsPermissionSnackBarShown:
          isNotificationsPermissionSnackBarShown ??
              this.isNotificationsPermissionSnackBarShown,
      isErrorSnackBarShown: isErrorSnackBarShown ?? this.isErrorSnackBarShown,
    );
  }
}
