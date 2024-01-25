import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/consts/app_colors.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.text,
    required this.iconData,
    required this.isActive,
  });

  final String text;
  final String iconData;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: SvgPicture.asset(
                  iconData,
                  colorFilter: ColorFilter.mode(
                    isActive ? AppColors.white : AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
