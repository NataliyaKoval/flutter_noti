import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/image_assets.dart';

class BoldListTile extends StatelessWidget {
  const BoldListTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, height: 1.5, fontWeight: FontWeight.w700),
      ),
      trailing: SvgPicture.asset(ImageAssets.checkbox),
    );
  }
}
