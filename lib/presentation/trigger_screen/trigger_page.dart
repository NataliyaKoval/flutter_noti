import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/triggers.dart';
import 'package:noti/presentation/trigger_screen/widgets/bold_list_tile.dart';
import 'package:noti/presentation/trigger_screen/widgets/custom_list_tile.dart';
import 'package:noti/presentation/trigger_screen/widgets/custom_expansion_tile.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/custom_app_bar.dart';

enum LineVisibility { full, partial, none }

class TriggerPage extends StatelessWidget {
  const TriggerPage({super.key, required this.title, required this.items});

  final String title;
  final List<TriggerItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: CustomAppBar(
          title: title,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _displayListView(items[index]);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: Offset(0, -4),
                  blurRadius: 20,
                )
              ],
            ),
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 32),
            child: BigFilledButton(
              text: 'Save',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayListView(TriggerItem item,
      [LineVisibility lineVisibility = LineVisibility.none]) {
    return switch (item) {
      AllTriggers() => BoldListTile(title: item.label),
      Category() => CustomExpansionTile(
          title: item.label,
          lineVisibility: lineVisibility,
          children: item.children.mapIndexed((index, e) {
            if (index == item.children.length - 1) {
              return _displayListView(e, LineVisibility.partial);
            }
            return _displayListView(e, LineVisibility.full);
          }).toList()),
      Option() => CustomListTile(
          text: item.label,
          lineVisibility: lineVisibility,
        ),
    };
  }
}
