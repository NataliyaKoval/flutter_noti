import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/icon_ids_list.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/presentation/add_new_notification_screen/bloc/add_new_notification_cubit.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/icon_bottom_sheet.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/multiline_text_field.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/select_icon_button.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/subtitle_text.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/inputs_row.dart';

class AddNewNotificationPage extends StatelessWidget {
  const AddNewNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewNotificationCubit(),
      child: Builder(builder: (context) {
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
            child:
                BlocBuilder<AddNewNotificationCubit, AddNewNotificationState>(
                    builder:
                        (BuildContext context, AddNewNotificationState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(text: Strings.addNewStrings.message),
                  MultilineTextField(
                    onChanged: (String value) {
                      context.read<AddNewNotificationCubit>().getMessage(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  SubtitleText(text: Strings.addNewStrings.typeTime),
                  TimeInputsRow(onChanged: (TimeInputId id, String value) {
                    context.read<AddNewNotificationCubit>().getTime(id, value);
                  }),
                  const SizedBox(height: 24),
                  SubtitleText(text: Strings.addNewStrings.icon),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.gray),
                          color: state.isIconChosen
                              ? iconColorsList[state.iconBackgroundIndex]
                              : AppColors.white,
                        ),
                        child: Center(
                            child: state.isIconChosen
                                ? SvgPicture.asset(
                                    'assets/icons/${iconIdsList[state.iconIndex]}.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.plumpPurple, BlendMode.srcIn),
                                    width: 40,
                                    height: 40,
                                  )
                                : SvgPicture.asset(ImageAssets.placeholder)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SelectIconButton(
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
                              value: context.read<AddNewNotificationCubit>(),
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
                    onPressed: state.isConfirmButtonEnabled ? () {} : null,
                    text: Strings.addNewStrings.confirmButtonText,
                  ),
                ],
              );
            }),
          ),
        );
      }),
    );
  }
}
