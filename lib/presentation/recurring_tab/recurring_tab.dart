import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/presentation/one_minute_notifications_screen/one_ninute_notifications_page.dart';

class RecurringTab extends StatelessWidget {
  const RecurringTab({super.key});

  static const List<int> _recurringTime = [1, 3, 5];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _recurringTime.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OneMinuteNotificationsPage(),
            ),
          );
        },
        title: Text(
          '${_recurringTime[index]} minute',
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: SvgPicture.asset(
          ImageAssets.arrowForwardIos,
          colorFilter: const ColorFilter.mode(
            AppColors.plumpPurple,
            BlendMode.srcIn,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: const Border(
          bottom: BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}
