import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/icon_ids_list.dart';

class IconSelectionListView extends StatelessWidget {
  const IconSelectionListView({
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
      separatorBuilder: (context, index) => const SizedBox(
        width: 6,
      ),
      itemCount: iconIdsList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
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
                    border: Border.all(color: AppColors.plumpPurple, width: 3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/${iconIdsList[index]}.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.plumpPurple,
                      BlendMode.srcIn,
                    ),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
