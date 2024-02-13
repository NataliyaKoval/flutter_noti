import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';
import 'package:noti/domain/use_cases/get_saved_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_notification_use_case.dart';
import 'package:noti/presentation/add_new_notification_screen/bloc/add_new_notification_cubit.dart';
import 'package:noti/presentation/widgets/custom_app_bar.dart';
import 'package:noti/presentation/widgets/icon_bottom_sheet.dart';
import 'package:noti/presentation/widgets/multiline_text_field.dart';
import 'package:noti/presentation/widgets/notification_icon.dart';
import 'package:noti/presentation/widgets/small_outlined_button.dart';
import 'package:noti/presentation/widgets/subtitle_text.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/time_inputs_row.dart';

class AddNewNotificationPage extends StatefulWidget {
  const AddNewNotificationPage({super.key, this.id, required this.title});

  final int? id;
  final String title;

  @override
  State<AddNewNotificationPage> createState() => _AddNewNotificationPageState();
}

class _AddNewNotificationPageState extends State<AddNewNotificationPage> {
  late final TextEditingController messageController;
  late final TextEditingController hoursFirstDigitController;
  late final TextEditingController hoursSecondDigitController;
  late final TextEditingController minutesFirstDigitController;
  late final TextEditingController minutesSecondDigitController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    hoursFirstDigitController = TextEditingController();
    hoursSecondDigitController = TextEditingController();
    minutesFirstDigitController = TextEditingController();
    minutesSecondDigitController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    hoursFirstDigitController.dispose();
    hoursSecondDigitController.dispose();
    minutesFirstDigitController.dispose();
    minutesSecondDigitController.dispose();
    super.dispose();
  }

  void _setControllersText(AddNewNotificationState state) {
    messageController.text = state.message;
    hoursFirstDigitController.text = state.hoursFirstDigit;
    hoursSecondDigitController.text = state.hoursSecondDigit;
    minutesFirstDigitController.text = state.minutesFirstDigit;
    minutesSecondDigitController.text = state.minutesSecondDigit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        AddNewNotificationCubit cubit = AddNewNotificationCubit(
          savedNotificationId: widget.id,
          saveNotificationUseCase: SaveNotificationUseCase(
            oneTimeNotificationsRepository:
                context.read<OneTimeNotificationsRepository>(),
          ),
          getSavedNotificationUseCase: GetSavedNotificationUseCase(
            oneTimeNotificationsRepository:
            context.read<OneTimeNotificationsRepository>(),
          ),
        );

        _setControllersText(cubit.state);
        cubit.getSavedNotification();
        return cubit;
      },
      child: BlocListener<AddNewNotificationCubit, AddNewNotificationState>(
        listener: (BuildContext context, AddNewNotificationState state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _setControllersText(state);
          });
          if (state.isConfirmed == true) {
            Navigator.pop(context);
          }
          if (state.isNotificationsPermissionSnackBarShown) {
            const permissionSnackBar = SnackBar(
              content:
                  Text('Please allow notifications in your phone settings'),
            );
            ScaffoldMessenger.of(context).showSnackBar(permissionSnackBar).closed.then(
                (value) => context
                    .read<AddNewNotificationCubit>()
                    .onNotificationsPermissionSnackBarHidden());
          }
          if (state.isErrorSnackBarShown) {
            const errorSnackBar = SnackBar(
              content:
              Text('Something went wrong'),
            );
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar).closed.then(
                    (value) => context
                    .read<AddNewNotificationCubit>()
                    .onErrorSnackBarHidden());
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: AppColors.white,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(44),
                child: CustomAppBar(
                  title: widget.title,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 32,
                  left: 16,
                  right: 16,
                ),
                child: BlocBuilder<AddNewNotificationCubit,
                    AddNewNotificationState>(
                  builder: (
                    BuildContext context,
                    AddNewNotificationState state,
                  ) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubtitleText(text: Strings.addNewStrings.message),
                        MultilineTextField(
                          controller: messageController,
                          onChanged: (String value) {
                            context
                                .read<AddNewNotificationCubit>()
                                .setMessage(value);
                          },
                        ),
                        const SizedBox(height: 24),
                        SubtitleText(text: Strings.addNewStrings.typeTime),
                        TimeInputsRow(
                          onChanged: (TimeInputId id, String value) {
                            context
                                .read<AddNewNotificationCubit>()
                                .setTime(id, value);
                          },
                          hoursFirstDigitController: hoursFirstDigitController,
                          hoursSecondDigitController:
                              hoursSecondDigitController,
                          minutesFirstDigitController:
                              minutesFirstDigitController,
                          minutesSecondDigitController:
                              minutesSecondDigitController,
                        ),
                        const SizedBox(height: 24),
                        SubtitleText(text: Strings.addNewStrings.icon),
                        Row(
                          children: [
                            NotificationIcon(
                              iconBackgroundIndex: state.iconBackgroundIndex,
                              iconIndex: state.iconIndex,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SmallOutlinedButton(
                              text: Strings.addNewStrings.selectButtonText,
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  backgroundColor: AppColors.white,
                                  builder: (BuildContext innerContext) =>
                                      BlocProvider.value(
                                    value:
                                        context.read<AddNewNotificationCubit>(),
                                    child: BlocBuilder<AddNewNotificationCubit,
                                        AddNewNotificationState>(
                                      builder: (
                                        BuildContext context,
                                        AddNewNotificationState state,
                                      ) {
                                        return IconBottomSheet(
                                          iconIndexPicker:
                                              state.iconIndexPicker,
                                          iconBackgroundIndexPicker:
                                              state.iconBackgroundIndexPicker,
                                          onColorTap: (int index) {
                                            context
                                                .read<AddNewNotificationCubit>()
                                                .setIconBackgroundIndexPicker(
                                                    index);
                                          },
                                          onIconTap: (int index) {
                                            context
                                                .read<AddNewNotificationCubit>()
                                                .setIconIndexPicker(index);
                                          },
                                          onButtonPressed: () => context
                                              .read<AddNewNotificationCubit>()
                                              .applyIconAndBackground(),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        BigFilledButton(
                          onPressed: state.isConfirmButtonEnabled
                              ? () {
                                  context
                                      .read<AddNewNotificationCubit>()
                                      .createAndSaveNotification();
                                }
                              : null,
                          text: Strings.addNewStrings.confirmButtonText,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
