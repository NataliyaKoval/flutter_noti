import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/di/providers.dart';
import 'package:noti/presentation/notifications_screen/notifications_page.dart';
import 'package:noti/themes/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<OneTimeNotificationEntity>(
      OneTimeNotificationEntityAdapter());
  await Hive.openBox<OneTimeNotificationEntity>('OneTimeNotifications');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        // theme: ThemeData(
        //   useMaterial3: true,
        // ),
        //home: const LoginPage(),
        home: const NotificationsPage(),
      ),
    );
  }
}
