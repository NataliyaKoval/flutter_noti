import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 16,),
          disabledBackgroundColor: AppColors.gray,
          backgroundColor: AppColors.plumpPurple,
          foregroundColor: AppColors.blueMagentaViolet,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          Strings.loginPageStrings.buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            //height: 1.5,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
