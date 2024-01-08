import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/add_new_notification_screen/bloc/add_new_notification_cubit.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/icon_background_list_view.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/icon_selection_list_view.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';

class IconBottomSheet extends StatelessWidget {
  const IconBottomSheet({
    super.key,
    required this.iconIndex,
    required this.iconBackgroundIndex,
  });

  final int iconIndex;
  final int iconBackgroundIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                Strings.addNewStrings.bottomSheetTitle,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.eerieBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: SvgPicture.asset(ImageAssets.cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 11),
          child: Text(
            Strings.addNewStrings.backgroundColors,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: AppColors.sonicSilver,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 16, right: 8),
          child: SizedBox(
            height: 70,
            child: IconBackgroundListView(
              iconIndex: iconBackgroundIndex,
              onTap: (int index) {
                context
                    .read<AddNewNotificationCubit>()
                    .getIconBackground(index);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 11),
          child: Text(
            Strings.addNewStrings.selectIcons,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: AppColors.sonicSilver,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: 70,
            child: IconSelectionListView(
              onTap: (int index) {
                context.read<AddNewNotificationCubit>().getIcon(index);
              },
              iconIndex: iconIndex,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 94,
            bottom: 34,
            left: 16,
            right: 16,
          ),
          child: BigFilledButton(
            text: Strings.addNewStrings.saveButtonText,
            onPressed: () {
              context.read<AddNewNotificationCubit>().displayIconData();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
