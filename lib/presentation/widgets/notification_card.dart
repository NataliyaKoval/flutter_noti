import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/icon_ids_list.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/widgets/small_outlined_button.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.id,
    required this.message,
    this.time,
    this.interval,
    this.colorIndex,
    this.iconIndex,
    required this.onPressed,
  });

  final int id;
  final String message;
  final String? time;
  final int? interval;
  final int? colorIndex;
  final int? iconIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.ghostWhite,
        border: Border.all(color: AppColors.plumpPurple, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              colorIndex != null && iconIndex != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.sonicSilver, width: 1),
                            shape: BoxShape.circle,
                            color: iconColorsList[colorIndex!]),
                        child: SvgPicture.asset(
                            'assets/icons/${iconIdsList[iconIndex!]}.svg'),
                      ),
                    )
                  : Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Strings.notificationsScreenStrings.time,
                    style: const TextStyle(
                        color: AppColors.sonicSilver, height: 1.4),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    time ?? '$interval minute',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.43,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Strings.notificationsScreenStrings.message,
                    style: const TextStyle(
                        color: AppColors.sonicSilver, height: 1.43),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.43,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: SmallOutlinedButton(
                        text: Strings.notificationsScreenStrings.selectTriger1,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: SmallOutlinedButton(
                        text: Strings.notificationsScreenStrings.selectTriger2,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: SvgPicture.asset(ImageAssets.delete),
              padding: EdgeInsets.zero,
              onPressed: () {
                onPressed(id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
