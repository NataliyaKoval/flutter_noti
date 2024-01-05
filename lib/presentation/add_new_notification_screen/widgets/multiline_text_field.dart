import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';

class MultilineTextField extends StatelessWidget {
  const MultilineTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: Strings.addNewStrings.hint,
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 16,
          height: 1.5,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: AppColors.platinum,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: AppColors.plumpPurple,
            width: 1,
          ),
        ),
      ),
      minLines: 4,
      maxLines: 4,
      keyboardType: TextInputType.multiline,
    );
  }
}
