class RecurringNotification {
  const RecurringNotification({
    required this.id,
    required this.message,
    this.colorIndex,
    this.iconIdIndex,
    required this.interval
  });

  final int id;
  final String message;
  final int? colorIndex;
  final int? iconIdIndex;
  final int interval;
}
