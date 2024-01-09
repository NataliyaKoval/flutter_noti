import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/icon_ids_list.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.id,
    required this.message,
    required this.time,
    this.colorIndex,
    this.iconIndex,
    required this.onPressed,
  });

  final String id;
  final String message;
  final String time;
  final int? colorIndex;
  final int? iconIndex;
  final Function(String) onPressed;

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
                    time,
                    style: TextStyle(),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    Strings.notificationsScreenStrings.message,
                    style: const TextStyle(
                        color: AppColors.sonicSilver, height: 1.4),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(message),
                ],
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
