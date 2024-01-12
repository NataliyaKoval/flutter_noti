import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/icon_ids_list.dart';
import 'package:noti/consts/image_assets.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon(
      {super.key,
      required this.isIconChosen,
      required this.iconBackgroundIndex,
      required this.iconIndex});

  final bool isIconChosen;
  final int iconBackgroundIndex;
  final int iconIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gray),
        color: isIconChosen
            ? iconColorsList[iconBackgroundIndex]
            : AppColors.white,
      ),
      child: Center(
          child: isIconChosen
              ? SvgPicture.asset(
                  'assets/icons/${iconIdsList[iconIndex]}.svg',
                  colorFilter: const ColorFilter.mode(
                      AppColors.plumpPurple, BlendMode.srcIn),
                  width: 40,
                  height: 40,
                )
              : SvgPicture.asset(ImageAssets.placeholder)),
    );
  }
}
