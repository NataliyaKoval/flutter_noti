import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';
import 'package:noti/consts/icon_ids_list.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/consts/triggers.dart';
import 'package:noti/presentation/add_new_notification_screen/add_new_notification_page.dart';
import 'package:noti/presentation/add_recurring_notification_screen/add_recurring_notification_page.dart';
import 'package:noti/presentation/one_time_tab/bloc/one_time_tab_cubit.dart';
import 'package:noti/presentation/repeating_notifications_screen/bloc/repeating_notifications_cubit.dart';
import 'package:noti/presentation/trigger_screen/trigger_page.dart';
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
  final DateTime? time;
  final int? interval;
  final int? colorIndex;
  final int? iconIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    String? hours = time?.hour.toString().padLeft(2, "0");
    String? minutes = time?.minute.toString().padLeft(2, "0");

    return InkWell(
      onTap: () async {
        if (interval != null) {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddRecurringNotificationPage(
                interval: interval!,
                id: id,
                title: 'Edit notification',
              ),
            ),
          );
          //TODO
          if (!context.mounted) return;
          context.read<RepeatingNotificationsCubit>().getNotifications();
        } else {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNewNotificationPage(
                id: id,
                title: 'Edit notification',
              ),
            ),
          );
          if (!context.mounted) return;
          context.read<OneTimeTabCubit>().getOneTimeNotifications();
        }
      },
      child: Container(
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
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/icons/${iconIdsList[iconIndex!]}.svg', colorFilter: ColorFilter.mode(AppColors.plumpPurple, BlendMode.srcIn),  ),
                          ),
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
                      interval != null ? '$interval minute' : '$hours:$minutes',
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
                          text:
                              Strings.notificationsScreenStrings.selectTrigger1,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TriggerPage(
                                  title: 'Select trigger 1',
                                  items: items1,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: SmallOutlinedButton(
                          text:
                              Strings.notificationsScreenStrings.selectTrigger2,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TriggerPage(
                                  title: 'Select trigger 2',
                                  items: items2,
                                ),
                              ),
                            );
                          },
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
      ),
    );
  }
}
