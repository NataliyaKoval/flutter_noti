import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/presentation/trigger_screen/trigger_page.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({
    super.key,
    required this.text,
    required this.lineVisibility,
  });

  final String text;
  final LineVisibility lineVisibility;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: widget.lineVisibility == LineVisibility.full ||
                widget.lineVisibility == LineVisibility.partial,
            child: Stack(
              children: [
                widget.lineVisibility == LineVisibility.full
                    ? const Padding(
                        padding: EdgeInsets.only(left: 27, right: 10),
                        child: VerticalDivider(
                          color: AppColors.antiFlashWhite,
                          width: 1,
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 27, right: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 26,
                              child: VerticalDivider(
                                color: AppColors.antiFlashWhite,
                                width: 1,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
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
                              width: 1, color: AppColors.antiFlashWhite),
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
            ),
          ),
          Expanded(
            child: ListTile(
              shape: const Border(
                top: BorderSide(color: AppColors.antiFlashWhite),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(widget.text),
              ),
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
            ),
          ),
        ],
      ),
    );
  }
}
