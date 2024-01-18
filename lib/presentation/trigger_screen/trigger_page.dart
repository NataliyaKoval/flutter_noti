import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/trigger_screen/widgets/bold_list_tile.dart';
import 'package:noti/presentation/trigger_screen/widgets/custom_list_tile.dart';
import 'package:noti/presentation/widgets/custom_expansion_tile.dart';

enum LineVisibility { full, partial, none }

class TriggerPage extends StatelessWidget {
  const TriggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.eerieBlack,
        toolbarHeight: 44,
        centerTitle: true,
        title: Text(
          'Select trigger 1',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _displayListView(items[index]);
        },
      ),
    );
  }

  Widget _displayListView(TriggerItem item, [LineVisibility lineVisibility = LineVisibility.none]) {
    return switch (item) {
      AllTriggers() => BoldListTile(title: item.label),
      Category() =>
          CustomExpansionTile(
              title: item.label,
              lineVisibility: lineVisibility,
              children: item.children.mapIndexed((index, e) {
                if (index == item.children.length - 1) {
                  return _displayListView(e, LineVisibility.partial);
                }
                return _displayListView(e, LineVisibility.full);
              }).toList()),
      Option() =>
          CustomListTile(
            text: item.label,
            lineVisibility: lineVisibility,
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
