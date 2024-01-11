import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/get_recurring_notifications_use_case.dart';
import 'package:noti/presentation/add_recurring_notification_screen/add_recurring_notification_page.dart';
import 'package:noti/presentation/notifications_screen/widgets/button_with_icon.dart';
import 'package:noti/presentation/notifications_screen/widgets/notification_card.dart';
import 'package:noti/presentation/one_minute_notifications_screen/bloc/one_minute_notifications_cubit.dart';

class OneMinuteNotificationsPage extends StatelessWidget {
  const OneMinuteNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.eerieBlack,
        toolbarHeight: 44,
        centerTitle: true,
        title: Text(Strings.recurringStrings.oneMinute),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => OneMinuteNotificationsCubit(
          getRecurringNotificationsUseCase: GetRecurringNotificationsUseCase(
            repository: context.read<Repository>(),
          ),
        )..getOneMinuteNotifications(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: BlocBuilder<OneMinuteNotificationsCubit,
                OneMinuteNotificationsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ListView.separated(
                      padding: const EdgeInsets.only(top: 16),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: state.oneMinuteNotifications.length,
                      itemBuilder: (context, index) => NotificationCard(
                        id: state.oneMinuteNotifications[index].id,
                        message: state.oneMinuteNotifications[index].message,
                        time:
                            '1 minute',
                        colorIndex: state.oneMinuteNotifications[index].colorIndex,
                        iconIndex: state.oneMinuteNotifications[index].iconIdIndex,
                        onPressed: (int) {},
                        //context
                            //.read<OneMinuteNotificationsCubit>()
                            //.removeOneTimeNotification,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: ButtonWithIcon(
                        onPressed: () =>  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddRecurringNotificationPage(),
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
