import 'package:flutter/material.dart';
import 'package:noti/data/data_sources/local_database/one_time_notifications_dao.dart';
import 'package:noti/data/data_sources/local_database/recurring_notifications_dao.dart';
import 'package:noti/data/repository/one_time_notifications_repository_impl.dart';
import 'package:noti/data/repository/recurring_notifications_repository_impl.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> providers = <SingleChildWidget>[
    Provider<OneTimeNotificationsDao>(
      create: (BuildContext context) => OneTimeNotificationsDao(),
    ),
    Provider<RecurringNotificationsDao>(
      create: (BuildContext context) => RecurringNotificationsDao(),
    ),
    Provider<OneTimeNotificationsRepository>(
      create: (BuildContext context) => OneTimeNotificationsRepositoryImpl(
        oneTimeNotificationsDao: context.read<OneTimeNotificationsDao>(),
      ),
    ),
    Provider<RecurringNotificationsRepository>(
      create: (BuildContext context) => RecurringNotificationsRepositoryImpl(
        recurringNotificationsDao: context.read<RecurringNotificationsDao>(),
      ),
    ),
  ];
}
