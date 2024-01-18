import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/presentation/trigger_screen/trigger_page.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    required this.lineVisibility,
  });

  final String title;
  final List<Widget> children;
  final LineVisibility lineVisibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: lineVisibility == LineVisibility.full ||
              lineVisibility == LineVisibility.partial,
          child: Positioned.fill(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _displayLine(),
            ),
          ),
        ),
        Padding(
          padding: lineVisibility == LineVisibility.full ||
                  lineVisibility == LineVisibility.partial
              ? const EdgeInsets.only(left: 42)
              : const EdgeInsets.only(left: 0),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            trailing: SvgPicture.asset(ImageAssets.checkbox),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _displayLine() {
    if (lineVisibility == LineVisibility.full) {
      return Stack(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: VerticalDivider(
                color: AppColors.antiFlashWhite,
                width: 1,
              )),
          Positioned(
            top: 20,
            left: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1, color: AppColors.antiFlashWhite),
                  ),
                ),
                const SizedBox(
                  width: 7,
                  child: Divider(
                    color: AppColors.antiFlashWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (lineVisibility == LineVisibility.partial) {
      return Stack(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: AppColors.antiFlashWhite,
                      width: 1,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              )),
          Positioned(
            top: 20,
            left: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: AppColors.antiFlashWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                  child: Divider(
                    color: AppColors.antiFlashWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
