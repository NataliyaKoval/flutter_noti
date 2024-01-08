import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_colors_list.dart';

class IconBackgroundListView extends StatelessWidget {
  const IconBackgroundListView({
    super.key,
    required this.onTap,
    required this.iconIndex,
  });

  final void Function(int index) onTap;
  final int iconIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) =>
      const SizedBox(
        width: 6,
      ),
      itemCount: iconColorsList.length,
      itemBuilder: (context, index) =>
          InkWell(
            onTap: () {
              onTap(index);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  visible: index == iconIndex,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: AppColors.plumpPurple),
                    ),),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.platinum),
                    color: iconColorsList[index],
                  ),
                ),
              ],),
          ),
    );
  }
}
