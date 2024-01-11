import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: AppColors.plumpPurple,
            foregroundColor: AppColors.blueMagentaViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.add),
              const SizedBox(
                width: 6,
              ),
              Text(
                Strings.notificationsScreenStrings.addNew,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
