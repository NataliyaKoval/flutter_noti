import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/repeating_notifications_screen/repeating_notifications_page.dart';

class RecurringTab extends StatelessWidget {
  const RecurringTab({super.key});

  static const List<int> _interval = [1, 3, 5];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _interval.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RepeatingNotificationsPage(
                interval: _interval[index],
                title: _interval[index] == 1 ? 'minute' : 'minutes',
              ),
            ),
          );
        },
        title: Text(
          '${_interval[index]} ${Strings.notificationsScreenStrings.minute}',
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
