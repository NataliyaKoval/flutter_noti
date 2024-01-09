import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_one_time_notification_use_case.dart';
import 'package:noti/presentation/notifications_screen/widgets/button_with_icon.dart';
import 'package:noti/presentation/notifications_screen/widgets/notification_card.dart';
import 'package:noti/presentation/one_time_tab/bloc/one_time_tab_cubit.dart';

class OneTimeTab extends StatelessWidget {
  const OneTimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeTabCubit(
        getOneTimeNotificationsUseCase: GetOneTimeNotificationsUseCase(
          repository: context.read<Repository>(),
        ),
        removeOneTimeNotificationUseCase: RemoveOneTimeNotificationUseCase(
          repository: context.read<Repository>(),
        ),
      )..getOneTimeNotifications(),
      child: BlocBuilder<OneTimeTabCubit, OneTimeTabState>(
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
                      onPressed: context.read<OneTimeTabCubit>().removeOneTimeNotification,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: ButtonWithIcon(
                      onPressed: context
                          .read<OneTimeTabCubit>()
                          .getOneTimeNotifications,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
