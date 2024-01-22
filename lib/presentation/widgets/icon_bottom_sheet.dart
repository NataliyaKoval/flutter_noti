import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/widgets/icon_background_list_view.dart';
import 'package:noti/presentation/widgets/icon_selection_list_view.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';

class IconBottomSheet extends StatelessWidget {
  const IconBottomSheet({
    super.key,
    required this.iconIndex,
    required this.iconBackgroundIndex,
    required this.onColorTap,
    required this.onIconTap,
    required this.onButtonPressed,
  });

  final int iconIndex;
  final int iconBackgroundIndex;
  final Function(int index) onColorTap;
  final Function(int index) onIconTap;
  final Function onButtonPressed;

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
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            height: 70,
            child: IconBackgroundListView(
              iconIndex: iconBackgroundIndex,
              onTap: (int index) {
                onColorTap(index);
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
        SizedBox(
          height: 70,
          child: IconSelectionListView(
            onTap: (int index) {
              onIconTap(index);
            },
            iconIndex: iconIndex,
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
              onButtonPressed();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
