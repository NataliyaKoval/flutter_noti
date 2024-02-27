int createNotificationId () {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}