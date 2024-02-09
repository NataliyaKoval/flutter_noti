import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/notification_icon_ids_list.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.iconBackgroundIndex,
    required this.iconIndex,
  });

  final int? iconBackgroundIndex;
  final int? iconIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gray),
        color: iconBackgroundIndex != null
            ? iconColorsList[iconBackgroundIndex!]
            : AppColors.white,
      ),
      child: Center(
        child: iconIndex != null
            ? SvgPicture.asset(
                'assets/icons/${notificationIconIdsList[iconIndex!]}.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.plumpPurple, BlendMode.srcIn),
                width: 40,
                height: 40,
              )
            : SvgPicture.asset(ImageAssets.placeholder),
      ),
    );
  }
}
