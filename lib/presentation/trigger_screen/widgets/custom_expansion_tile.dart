import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/presentation/trigger_screen/trigger_page.dart';

class CustomExpansionTile extends StatefulWidget {
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
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: widget.lineVisibility == LineVisibility.full ||
              widget.lineVisibility == LineVisibility.partial,
          child: Positioned.fill(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _displayLine(),
            ),
          ),
        ),
        Padding(
          padding: widget.lineVisibility == LineVisibility.full ||
                  widget.lineVisibility == LineVisibility.partial
              ? const EdgeInsets.only(left: 42)
              : const EdgeInsets.only(left: 0),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            trailing: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: isChecked
                  ? SvgPicture.asset(ImageAssets.checkbox)
                  : Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.antiFlashWhite,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                widget.title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            children: widget.children,
          ),
        ),
      ],
    );
  }

  Widget _displayLine() {
    if (widget.lineVisibility == LineVisibility.full) {
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
    } else if (widget.lineVisibility == LineVisibility.partial) {
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
