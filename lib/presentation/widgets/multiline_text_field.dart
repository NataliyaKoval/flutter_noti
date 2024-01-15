import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';

class MultilineTextField extends StatelessWidget {
  const MultilineTextField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: Strings.addNewStrings.hint,
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 16,
          height: 1.5,
        ),
        helperText: ' ',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: AppColors.platinum,
            width: 1,
          ),
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
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: AppColors.deepCarminePink,
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.deepCarminePink,
        ),
      ),
      minLines: 4,
      maxLines: 4,
      cursorHeight: 24,
      cursorColor: AppColors.eerieBlack,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: AppColors.eerieBlack,
      ),
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      // validator: (value) => value == null || value.isEmpty
      //     ? Strings.addNewStrings.errorMessage
      //     : null,
    );
  }
}
