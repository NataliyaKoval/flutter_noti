import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/image_assets.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    required this.isLineVisible,
  });

  final String title;
  final List<Widget> children;
  final bool isLineVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isLineVisible,
          child: Positioned.fill(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Stack(
                // alignment: Alignment.topCenter,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: VerticalDivider(
                      color: Colors.red,
                      width: 1,
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
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                          child: Divider(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: isLineVisible
              ? const EdgeInsets.only(left: 42)
              : const EdgeInsets.only(left: 0),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            trailing: SvgPicture.asset(ImageAssets.checkbox),
            //tilePadding: EdgeInsets.symmetric(vertical: 16),
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
}
