import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';

class IconBackgroundCircle extends StatelessWidget {
  const IconBackgroundCircle({
    super.key,
    required this.color,
    required this.onTap,
  });

  final Color color;
  final void Function(Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(color);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: AppColors.plumpPurple),
        ),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: AppColors.platinum),
            color: color,
          ),
        ),
      ),
    );
  }
}
