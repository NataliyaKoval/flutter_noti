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
    required this.isFirstItem,
    required this.depth,
  });

  final String text;
  final LineVisibility lineVisibility;
  final bool isFirstItem;
  final int depth;

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
            child: Container(
              decoration: widget.depth == 1 &&
                      widget.lineVisibility == LineVisibility.partial
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.platinum, width: 1),
                      ),
                    )
                  : null,
              child: Stack(
                children: [
                  widget.lineVisibility == LineVisibility.full
                      ? Padding(
                          padding: widget.depth == 2
                              ? EdgeInsets.only(left: 24, right: 11)
                              : EdgeInsets.only(left: 27, right: 11),
                          child: VerticalDivider(
                            color: AppColors.antiFlashWhite,
                            width: 1,
                          ),
                        )
                      : Padding(
                          padding: widget.depth == 2
                              ? EdgeInsets.only(left: 24, right: 10)
                              : EdgeInsets.only(left: 27, right: 10),
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
                    left: widget.depth == 2 ? 21 : 24,
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
                              color: AppColors.platinum,
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
              ),
            ),
          ),
          Expanded(
            child: Container(
              // padding: EdgeInsets.only(left: 16),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                // contentPadding: EdgeInsets.only(top: 3, bottom: 3, right: 16),
                shape: _buildBorder(),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.text,
                          style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: AppColors.eerieBlack)),
                    ],
                  ),
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.antiFlashWhite,
                            border: Border.all(color: AppColors.platinum),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBorder() {
    if (widget.lineVisibility == LineVisibility.none) {
      return const Border(
        bottom: BorderSide(color: AppColors.platinum, width: 1),
      );
    } else if (widget.isFirstItem) {
      return const Border(
        bottom: BorderSide(color: AppColors.antiFlashWhite, width: 1),
        top: BorderSide(color: AppColors.antiFlashWhite, width: 1),
      );
    }
    return Border(
      bottom: BorderSide(
          color: widget.lineVisibility == LineVisibility.partial
              ? AppColors.platinum
              : AppColors.antiFlashWhite,
          width: 1),
    );
  }
}
