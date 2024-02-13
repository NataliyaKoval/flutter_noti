import 'package:noti/presentation/trigger_screen/trigger_item.dart';

List<TriggerItem> triggerItems1 = [
  AllTriggers(label: "All Triggers"),
  Category(
    label: 'Sport',
    children: [
      Category(
        label:
        'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
        children: [Option(label: '🚴 Biking'), Option(label: '🏃 Running')],
      ),
      Category(
        label: 'Evening',
        children: [
          Option(
            label:
            '🏓 Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
          ),
          Option(label: '🏐 Volleyball', hasCustomDivider: true),
        ],
      )
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