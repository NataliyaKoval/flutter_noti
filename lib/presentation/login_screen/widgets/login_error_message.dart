import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';

class LoginErrorMessage extends StatelessWidget {
  const LoginErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      color: AppColors.antiFlashWhite,
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.error),
          const SizedBox(width: 6,),
          Text(
            Strings.loginPageStrings.errorMessage,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.deepCarminePink,
            ),
          ),
        ],
      ),
    );
  }
}
