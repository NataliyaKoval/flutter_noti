class RecurringNotification {
  const RecurringNotification({
    required this.id,
    required this.message,
    this.colorIndex,
    this.iconIdIndex,
  });

  final int id;
  final String message;
  final int? colorIndex;
  final int? iconIdIndex;
}
