import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noti/consts/app_colors.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    super.key,
    required this.onChanged,
    required this.focusNode,
    required this.formatterRegExp,
  });

  final void Function(String) onChanged;
  final FocusNode focusNode;
  final String formatterRegExp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 48,
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp(formatterRegExp)),
        ],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        cursorHeight: 24,
        cursorWidth: 2,
        cursorColor: AppColors.eerieBlack,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        decoration: const InputDecoration(
          //contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
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
        validator: (value) => value == null || value.isEmpty
            ? ''
            : null,
        onChanged: onChanged,
      ),
    );
  }
}