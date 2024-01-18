import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.zero,
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.eerieBlack,
      labelStyle: const TextStyle(
          fontSize: 16, height: 1.5, fontWeight: FontWeight.w500),
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: AppColors.plumpPurple),
    ),
    listTileTheme: const ListTileThemeData(
      // contentPadding: EdgeInsets.all(0),
      // dense: true,
      // horizontalTitleGap: 0.0,
      // minLeadingWidth: 0,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      textColor: AppColors.eerieBlack,
      iconColor: AppColors.eerieBlack,
      collapsedTextColor: AppColors.eerieBlack,
      collapsedIconColor: AppColors.eerieBlack,
    ),
  );
}
