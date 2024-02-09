import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/notification_icon_ids_list.dart';

class IconSelectionListView extends StatelessWidget {
  const IconSelectionListView({
    super.key,
    required this.onTap,
    required this.iconIndex,
  });

  final void Function(int index) onTap;
  final int iconIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(padding: const EdgeInsets.only(left: 11),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(
        width: 6,
      ),
      itemCount: notificationIconIdsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: index == iconIndex ? 1 : 0,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.plumpPurple, width: 3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/${notificationIconIdsList[index]}.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.plumpPurple,
                      BlendMode.srcIn,
                    ),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
