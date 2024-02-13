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
      // shape: Border(bottom: BorderSide(color: AppColors.platinum,)),
      contentPadding: const EdgeInsets.only(
        left: 16,
        top: 4,
        right: 16,
        bottom: 4,
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 16, height: 1.5, fontWeight: FontWeight.w700),
      ),
      trailing: InkWell(
        customBorder: const CircleBorder(),
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
    );
  }
}
