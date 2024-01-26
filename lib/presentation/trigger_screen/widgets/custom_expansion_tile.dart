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
    required this.isFirstItem,
  });

  final String title;
  final List<Widget> children;
  final LineVisibility lineVisibility;
  final bool isFirstItem;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isChecked = false;
  bool _isExpanded = false;

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
        Container(
          padding: widget.lineVisibility == LineVisibility.full ||
                  widget.lineVisibility == LineVisibility.partial
              ? const EdgeInsets.only(left: 39)
              : const EdgeInsets.only(left: 0),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              shape: _buildBorder(),
              tilePadding: widget.lineVisibility == LineVisibility.full ||
                      widget.lineVisibility == LineVisibility.partial
                  ? const EdgeInsets.only(left: 13, right: 16, top: 3, bottom: 3)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              controlAffinity: ListTileControlAffinity.leading,
              leading: AnimatedRotation(
                turns: _isExpanded ? .5 : 0,
                duration: const Duration(milliseconds: 300),
                child: SvgPicture.asset(
                  ImageAssets.expandMore,
                  colorFilter: const ColorFilter.mode(
                      AppColors.plumpPurple, BlendMode.srcIn),
                ),
              ),
              trailing: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
                child: _isChecked
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
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
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
              onExpansionChanged: (value) {
                setState(() {
                  _isExpanded = value;
                });
              },
            ),
            //),
          ),
        )
      ],
    );
  }

  _buildBorder() {
    if (widget.isFirstItem) {
      return Border(
        top: BorderSide(
          color: AppColors.antiFlashWhite,
        ),
      );
    }
  }

  Widget _displayLine() {
    if (widget.lineVisibility == LineVisibility.full) {
      return Stack(
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 27, right: 11),
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
      );
    } else {
      return SizedBox();
    }
  }
}
