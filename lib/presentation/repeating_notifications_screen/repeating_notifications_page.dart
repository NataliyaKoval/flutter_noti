import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';
import 'package:noti/domain/use_cases/get_recurring_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_recurring_notification_use_case.dart';
import 'package:noti/presentation/add_recurring_notification_screen/add_recurring_notification_page.dart';
import 'package:noti/presentation/widgets/button_with_icon.dart';
import 'package:noti/presentation/widgets/custom_app_bar.dart';
import 'package:noti/presentation/widgets/notification_card.dart';
import 'package:noti/presentation/repeating_notifications_screen/bloc/repeating_notifications_cubit.dart';

class RepeatingNotificationsPage extends StatelessWidget {
  const RepeatingNotificationsPage({
    super.key,
    required this.interval,
    required this.title,
  });

  final int interval;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepeatingNotificationsCubit(
        getRecurringNotificationsUseCase: GetRecurringNotificationsUseCase(
          recurringNotificationsRepository:
              context.read<RecurringNotificationsRepository>(),
        ),
        removeRecurringNotificationUseCase: RemoveRecurringNotificationUseCase(
          recurringNotificationsRepository:
              context.read<RecurringNotificationsRepository>(),
        ),
        interval: interval,
      )..getNotifications(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: CustomAppBar(
            title: '$interval $title',
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: BlocBuilder<RepeatingNotificationsCubit,
                RepeatingNotificationsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ListView.separated(
                      padding: const EdgeInsets.only(top: 16),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) => NotificationCard(
                        id: state.notifications[index].id,
                        message: state.notifications[index].message,
                        interval: interval,
                        colorIndex: state.notifications[index].colorIndex,
                        iconIndex: state.notifications[index].iconIdIndex,
                        onPressed: context
                            .read<RepeatingNotificationsCubit>()
                            .removeNotification,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 34, top: 24),
                      child: ButtonWithIcon(
                          text: Strings.notificationsScreenStrings.addNew,
                          onPressed: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AddRecurringNotificationPage(
                                interval: interval,
                                title: Strings.addNewStrings.title,
                              ),
                            ));
                            if (!context.mounted) return;
                            context
                                .read<RepeatingNotificationsCubit>()
                                .getNotifications();
                          }),
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
