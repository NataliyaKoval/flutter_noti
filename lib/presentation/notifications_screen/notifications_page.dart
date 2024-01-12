import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_notification_use_case.dart';
import 'package:noti/presentation/notifications_screen/widgets/custom_tab.dart';
import 'package:noti/presentation/one_time_tab/bloc/one_time_tab_cubit.dart';
import 'package:noti/presentation/one_time_tab/one_time_tab.dart';
import 'package:noti/presentation/recurring_tab/recurring_tab.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Allow Notifications'),
              content: Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

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
            appBar: AppBar(
              toolbarHeight: 78,
              backgroundColor: AppColors.eerieBlack,
              centerTitle: true,
              title: Text(
                Strings.notificationsScreenStrings.title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(400, 62),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TabBar(
                      tabs: [
                        CustomTab(
                          text: Strings.notificationsScreenStrings.firstTab,
                          iconData: Icons.timer_outlined,
                        ),
                        CustomTab(
                          text: Strings.notificationsScreenStrings.secondTab,
                          iconData: Icons.history,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              //controller: _tabController,
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
