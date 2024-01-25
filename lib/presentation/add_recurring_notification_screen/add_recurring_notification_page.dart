import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/get_saved_recurring_notification_use_case.dart';
import 'package:noti/domain/use_cases/save_recurring_notification_use_case.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/custom_app_bar.dart';
import 'package:noti/presentation/widgets/icon_bottom_sheet.dart';
import 'package:noti/presentation/widgets/multiline_text_field.dart';
import 'package:noti/presentation/widgets/notification_icon.dart';
import 'package:noti/presentation/widgets/small_outlined_button.dart';
import 'package:noti/presentation/widgets/subtitle_text.dart';
import 'package:noti/presentation/add_recurring_notification_screen/bloc/add_recurring_notification_cubit.dart';

class AddRecurringNotificationPage extends StatefulWidget {
  const AddRecurringNotificationPage({
    super.key,
    required this.interval,
    this.id,
    required this.title,
  });

  final int interval;
  final int? id;
  final String title;

  @override
  State<AddRecurringNotificationPage> createState() =>
      _AddRecurringNotificationPageState();
}

class _AddRecurringNotificationPageState
    extends State<AddRecurringNotificationPage> {
  late final TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecurringNotificationCubit(
        saveRecurringNotificationUseCase: SaveRecurringNotificationUseCase(
          repository: context.read<Repository>(),
        ),
        interval: widget.interval,
        id: widget.id,
        getSavedRecurringNotificationUseCase:
            GetSavedRecurringNotificationUseCase(
          repository: context.read<Repository>(),
        ),
      )..getSavedNotification(),
      child: BlocListener<AddRecurringNotificationCubit,
          AddRecurringNotificationState>(
        listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            messageController.text = state.message;
          });
          if (state.isConfirmed == true) {
            Navigator.pop(context);
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
                child: BlocBuilder<AddRecurringNotificationCubit,
                    AddRecurringNotificationState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubtitleText(text: Strings.addNewStrings.message),
                        MultilineTextField(
                          controller: messageController,
                          onChanged: (String value) {
                            context
                                .read<AddRecurringNotificationCubit>()
                                .setMessage(value);
                          },
                        ),
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
                                            value: context.read<
                                                AddRecurringNotificationCubit>(),
                                            child: BlocBuilder<
                                                AddRecurringNotificationCubit,
                                                AddRecurringNotificationState>(
                                              builder: (BuildContext context,
                                                  AddRecurringNotificationState
                                                      state) {
                                                return IconBottomSheet(
                                                  iconIndex: state.iconIndex,
                                                  iconBackgroundIndex:
                                                      state.iconBackgroundIndex,
                                                  onColorTap: (int index) {
                                                    context
                                                        .read<
                                                            AddRecurringNotificationCubit>()
                                                        .setIconBackground(
                                                            index);
                                                  },
                                                  onIconTap: (int index) {
                                                    context
                                                        .read<
                                                            AddRecurringNotificationCubit>()
                                                        .setIcon(index);
                                                  },
                                                  onButtonPressed: () => context
                                                      .read<
                                                          AddRecurringNotificationCubit>()
                                                      .displayIconData(),
                                                );
                                              },
                                            )),
                                  );
                                }),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        BigFilledButton(
                          onPressed: state.isConfirmButtonEnabled
                              ? () {
                                  context
                                      .read<AddRecurringNotificationCubit>()
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
