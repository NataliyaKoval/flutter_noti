import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/image_assets.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/multiline_text_field.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/select_icon_button.dart';
import 'package:noti/presentation/add_new_notification_screen/widgets/subtitle_text.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/inputs_row.dart';

class AddNewNotificationPage extends StatelessWidget {
  const AddNewNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.eerieBlack,
        toolbarHeight: 44,
        centerTitle: true,
        title: Text(
          Strings.addNewStrings.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 34,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitleText(text: Strings.addNewStrings.message),
            const MultilineTextField(),
            const SizedBox(height: 24),
            SubtitleText(text: Strings.addNewStrings.typeTime),
            TimeInputsRow(
              onChanged: () {},
            ),
            const SizedBox(height: 24),
            SubtitleText(text: Strings.addNewStrings.icon),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: Center(
                      child: SvgPicture.asset(ImageAssets.placeholder)),
                ),
                const SizedBox(width: 16,),
                const SelectIconButton(),
              ],
            ),
            const Expanded(child: SizedBox()),
            BigFilledButton(onPressed: () { }, text: Strings.addNewStrings.confirmButtonText,),
          ],
        ),
      ),
    );
  }
}
