import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/notification_channels.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';
import 'package:noti/di/providers.dart';
import 'package:noti/presentation/login_screen/login_page.dart';
import 'package:noti/themes/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<OneTimeNotificationEntity>(
      OneTimeNotificationEntityAdapter());
  Hive.registerAdapter<RecurringNotificationEntity>(
      RecurringNotificationEntityAdapter());
  await Hive.openBox<OneTimeNotificationEntity>('OneTimeNotifications');
  await Hive.openBox<RecurringNotificationEntity>('RecurringNotifications');
  await AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelKey: NotificationChannels.scheduledChannel,
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelDescription: 'Notification channel for scheduled notifications',
      ),
      NotificationChannel(
        channelKey: NotificationChannels.recurringChannel,
        channelName: 'Recurring Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelDescription: 'Notification channel for recurring notifications',
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.eerieBlack,
        statusBarColor: AppColors.eerieBlack,
      ),
    );
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: Strings.appStrings.appName,
        theme: AppTheme.lightTheme,
        home: const LoginPage(),
      ),
    );
  }
}
