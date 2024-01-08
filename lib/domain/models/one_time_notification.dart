class OneTimeNotification {
  const OneTimeNotification({
    required this.id,
    required this.time,
    required this.message,
    this.colorIndex,
    this.iconIdIndex,
  });

  final String id;
  final DateTime time;
  final String message;
  final int? colorIndex;
  final int? iconIdIndex;
}
