import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noti/consts/app_colors.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    super.key,
    required this.onChanged,
    required this.focusNode,
    required this.formatterRegExp,
    required this.controller,
  });

  final void Function(String) onChanged;
  final FocusNode focusNode;
  final RegExp formatterRegExp;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 48,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          //LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.allow(formatterRegExp),
        ],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 24,
        cursorWidth: 2,
        cursorColor: AppColors.eerieBlack,
        cursorRadius: const Radius.circular(5),
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w700,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppColors.platinum,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppColors.plumpPurple,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppColors.deepCarminePink,
              width: 1,
            ),
          ),
          errorStyle: TextStyle(height: 0),
        ),
        validator: (value) => value == null || value.isEmpty ? '' : null,
        onChanged: onChanged,
      ),
    );
  }
}
