sealed class TriggerItem {
  final String label;
  final bool isChecked;

  const TriggerItem({
    required this.label,
    this.isChecked = false,
  });
}

class AllTriggers extends TriggerItem {
  AllTriggers({required super.label, super.isChecked});
}

class Category extends TriggerItem {
  Category({
    required super.label,
    super.isChecked,
    required this.children,
    this.isLineVisible = false,
  });

  final List<TriggerItem> children;
  final bool isLineVisible;

  Category copyWith({
    List<TriggerItem>? children,
    bool? isLineVisible,
    String? label,
  }) {
    return Category(
      children: children ?? this.children,
      isLineVisible: isLineVisible ?? this.isLineVisible,
      label: label ?? this.label,
    );
  }
}

class Option extends TriggerItem {
  Option({required super.label, super.isChecked});
}

List<TriggerItem> items2 = [
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
          Option(label: '🏐 Volleyball'),
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

List<TriggerItem> items1 = [
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
