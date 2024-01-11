import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/presentation/add_new_notification_screen/add_new_notification_page.dart';
import 'package:noti/presentation/notifications_screen/widgets/button_with_icon.dart';
import 'package:noti/presentation/notifications_screen/widgets/notification_card.dart';
import 'package:noti/presentation/one_time_tab/bloc/one_time_tab_cubit.dart';

class OneTimeTab extends StatefulWidget {
  const OneTimeTab({super.key});

  @override
  State<OneTimeTab> createState() => _OneTimeTabState();
}

class _OneTimeTabState extends State<OneTimeTab> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  @pragma('vm:entry-point')
  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    context
        .read<OneTimeTabCubit>()
        .removeOneTimeNotification(receivedNotification.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneTimeTabCubit, OneTimeTabState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => NotificationCard(
                    id: state.list[index].id,
                    message: state.list[index].message,
                    time:
                        '${state.list[index].time.hour}:${state.list[index].time.minute}',
                    colorIndex: state.list[index].colorIndex,
                    iconIndex: state.list[index].iconIdIndex,
                    onPressed: context
                        .read<OneTimeTabCubit>()
                        .removeOneTimeNotification,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: ButtonWithIcon(
                    //todo
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewNotificationPage(),
                      ));
                    }

                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
