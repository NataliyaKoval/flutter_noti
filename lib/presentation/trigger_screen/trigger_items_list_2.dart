import 'package:noti/presentation/trigger_screen/trigger_item.dart';

List<TriggerItem> triggerItems2 = [
  AllTriggers(label: "All Triggers"),
  Category(
    label: 'Sport',
    children: [
      Category(
        label: 'Morning',
        children: [
          Option(label: '🚴 Biking'),
          Option(label: '🏃 Running'),
        ],
      ),
      Category(
        label: 'Evening',
        children: [
          Option(label: '🏓 Ping Pong'),
          Option(label: '🏐 Volleyball'),
        ],
      ),
      Option(label: '🥊 Boxing'),
      Option(label: '⚽ Football'),
    ],
  ),
  Category(
    label: 'Work',
    children: [
      Option(label: '🗓️ Meeting'),
      Option(label: '🖨️ Print document'),
    ],
  ),
  Option(label: '⏰ Alarm'),
  Option(label: '🎉 Party'),
  Option(label: '🍜 Dinner'),
];