import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noti/consts/app_colors.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
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
              //color: AppColors.platinum,
              color: AppColors.plumpPurple,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
