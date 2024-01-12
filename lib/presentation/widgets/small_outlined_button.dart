import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';

class SmallOutlinedButton extends StatelessWidget {
  const SmallOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(158, 40),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        foregroundColor: AppColors.plumpPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(
          width: 1,
          color: AppColors.plumpPurple,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.43,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
