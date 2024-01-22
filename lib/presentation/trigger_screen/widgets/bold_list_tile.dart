import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';

class BoldListTile extends StatefulWidget {
  const BoldListTile({super.key, required this.title});

  final String title;

  @override
  State<BoldListTile> createState() => _BoldListTileState();
}

class _BoldListTileState extends State<BoldListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 16, height: 1.5, fontWeight: FontWeight.w700),
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
    );
  }
}
