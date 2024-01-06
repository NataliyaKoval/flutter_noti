import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';

class SelectIconButton extends StatelessWidget {
  const SelectIconButton({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 44,
        ),
        foregroundColor: AppColors.plumpPurple,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(
          width: 1,
          color: AppColors.plumpPurple,
        ),
      ),
      onPressed: onPressed,
      child: Text(Strings.addNewStrings.selectButtonText),
    );
  }
}
