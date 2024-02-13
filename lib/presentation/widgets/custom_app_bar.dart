import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
  });

  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4.0,
            offset: const Offset(0.0, 0.5),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: AppColors.eerieBlack,
        centerTitle: true,
        elevation: 0,
        title: Text(title),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w700,
        ),
        leading: leading,
        bottom: bottom,
      ),
    );
  }
}
