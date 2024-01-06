import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/icon_background_circle.dart';

class IconBackgroundRow extends StatelessWidget {
  const IconBackgroundRow({super.key, required this.onTap, });

final void Function(Color value) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconBackgroundCircle(color: AppColors.aliceBlue, onTap: onTap),
        IconBackgroundCircle(color: AppColors.lavenderBlush, onTap: onTap),
        IconBackgroundCircle(color: AppColors.ivory, onTap: onTap),
        IconBackgroundCircle(color: AppColors.magnolia, onTap: onTap),
        IconBackgroundCircle(color: AppColors.honeydew, onTap: onTap),
      ],
    );
  }
}
