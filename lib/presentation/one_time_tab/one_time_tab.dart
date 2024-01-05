import 'package:flutter/material.dart';
import 'package:noti/presentation/notifications_screen/widgets/button_with_icon.dart';
import 'package:noti/presentation/notifications_screen/widgets/notification_card.dart';

class OneTimeTab extends StatelessWidget {
  const OneTimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          NotificationCard(),
          ButtonWithIcon(),
        ],
      ),
    );
  }
}
