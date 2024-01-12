import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/save_notification_use_case.dart';
import 'package:noti/presentation/add_new_notification_screen/bloc/add_new_notification_cubit.dart';
import 'package:noti/presentation/widgets/icon_bottom_sheet.dart';
import 'package:noti/presentation/widgets/multiline_text_field.dart';
import 'package:noti/presentation/widgets/notification_icon.dart';
import 'package:noti/presentation/widgets/small_outlined_button.dart';
import 'package:noti/presentation/widgets/subtitle_text.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/inputs_row.dart';

class AddNewNotificationPage extends StatelessWidget {
  const AddNewNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewNotificationCubit(
        saveNotificationUseCase: SaveNotificationUseCase(
          repository: context.read<Repository>(),
        ),
      ),
      child: BlocListener<AddNewNotificationCubit, AddNewNotificationState>(
        listener: (context, state) {
          if (state.isConfirmed == true) {
            Navigator.pop(context);
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: AppColors.eerieBlack,
                toolbarHeight: 44,
                centerTitle: true,
                title: Text(
                  Strings.addNewStrings.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
                          onChanged: (String value) {
                            context
                                .read<AddNewNotificationCubit>()
                                .getMessage(value);
                          },
                        ),
                        const SizedBox(height: 24),
                        SubtitleText(text: Strings.addNewStrings.typeTime),
                        TimeInputsRow(
                            onChanged: (TimeInputId id, String value) {
                          context
                              .read<AddNewNotificationCubit>()
                              .getTime(id, value);
                        }),
                        const SizedBox(height: 24),
                        SubtitleText(text: Strings.addNewStrings.icon),
                        Row(
                          children: [
                            NotificationIcon(
                              isIconChosen: state.isIconChosen,
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
                                          iconIndex: state.iconIndex,
                                          iconBackgroundIndex:
                                              state.iconBackgroundIndex,
                                          onColorTap: (int index) {
                                            context
                                                .read<AddNewNotificationCubit>()
                                                .getIconBackground(index);
                                          },
                                          onIconTap: (int index) {
                                            context
                                                .read<AddNewNotificationCubit>()
                                                .getIcon(index);
                                          },
                                          onButtonPressed: () => context
                                              .read<AddNewNotificationCubit>()
                                              .displayIconData(),
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
