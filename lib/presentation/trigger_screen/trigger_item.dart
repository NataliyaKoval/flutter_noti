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
  Option({required super.label, super.isChecked, this.hasCustomDivider = false});

  final bool hasCustomDivider;
}