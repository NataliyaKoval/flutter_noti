import 'package:flutter/material.dart';

class OneTimeNotification {
  const OneTimeNotification({
    required this.time,
    required this.message,
    required this.iconData,
  });

  final DateTime time;
  final String message;
  final IconData iconData;
}
