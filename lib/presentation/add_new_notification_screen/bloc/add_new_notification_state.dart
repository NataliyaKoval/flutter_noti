part of 'add_new_notification_cubit.dart';

@immutable
class AddNewNotificationState {
  const AddNewNotificationState({
    this.isConfirmButtonEnabled = false,
    this.iconIndex = 0,
    this.iconBackgroundIndex = 0,
    this.isIconChosen = false,
    this.isConfirmed = false,
  });

  final bool isConfirmButtonEnabled;
  final int iconIndex;
  final int iconBackgroundIndex;
  final bool isIconChosen;
  final bool isConfirmed;

  AddNewNotificationState copyWith({
    bool? isConfirmButtonEnabled,
    int? iconIndex,
    int? iconBackgroundIndex,
    bool? isIconChosen,
    bool? isConfirmed,
  }) {
    return AddNewNotificationState(
      isConfirmButtonEnabled: isConfirmButtonEnabled ??
          this.isConfirmButtonEnabled,
      iconIndex: iconIndex ?? this.iconIndex,
      iconBackgroundIndex: iconBackgroundIndex ?? this.iconBackgroundIndex,
      isIconChosen: isIconChosen ?? this.isIconChosen,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

}
