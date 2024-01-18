import 'package:flutter/material.dart';
import 'package:noti/presentation/trigger_screen/widgets/bold_list_tile.dart';
import 'package:noti/presentation/trigger_screen/widgets/custom_list_tile.dart';
import 'package:noti/presentation/widgets/custom_expansion_tile.dart';

class TriggerPage extends StatelessWidget {
  const TriggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _displayListView(items[index]);
        },
      ),
    );
  }

  Widget _displayListView(TriggerItem item, [bool isLineVisible = false]) {
    return switch (item) {
      AllTriggers() => BoldListTile(title: item.label),
      Category() => CustomExpansionTile(
          title: item.label,
          isLineVisible: isLineVisible,
          children: item.children.map((e) {
            return _displayListView(e, true);
          }).toList()),
      Option() => CustomListTile(
          text: item.label,
          isLineVisible: isLineVisible,
        ),
    };
  }
}

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

List<TriggerItem> items = [
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
