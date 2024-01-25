import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_notification_use_case.dart';
import 'package:noti/presentation/notifications_screen/widgets/custom_tab.dart';
import 'package:noti/presentation/one_time_tab/bloc/one_time_tab_cubit.dart';
import 'package:noti/presentation/one_time_tab/one_time_tab.dart';
import 'package:noti/presentation/recurring_tab/recurring_tab.dart';
import 'package:noti/presentation/widgets/custom_app_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeTabCubit(
        getOneTimeNotificationsUseCase: GetOneTimeNotificationsUseCase(
          repository: context.read<Repository>(),
        ),
        removeNotificationUseCase: RemoveNotificationUseCase(
          repository: context.read<Repository>(),
        ),
      )..getOneTimeNotifications(),
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(122),
              child: CustomAppBar(
                title: Strings.notificationsScreenStrings.title,
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 78),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      top: 14,
                    ),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.antiFlashWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        tabs: [
                          CustomTab(
                            text: Strings.notificationsScreenStrings.firstTab,
                            iconData: ImageAssets.timerTab,
                            isActive: activeTab == 0,
                          ),
                          CustomTab(
                            text: Strings.notificationsScreenStrings.secondTab,
                            iconData: ImageAssets.recursion,
                            isActive: activeTab == 1,
                          ),
                        ],
                        onTap: (value) {
                          if (value == 0) {
                            context
                                .read<OneTimeTabCubit>()
                                .getOneTimeNotifications();
                          }
                          setState(() {
                            activeTab = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                const OneTimeTab(),
                RecurringTab(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
