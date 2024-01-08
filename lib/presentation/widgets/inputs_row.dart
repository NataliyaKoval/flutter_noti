import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/presentation/widgets/time_input_field.dart';

class TimeInputsRow extends StatefulWidget {
  const TimeInputsRow({super.key, required this.onChanged});

  final Function onChanged;

  @override
  State<TimeInputsRow> createState() => _TimeInputsRowState();
}

class _TimeInputsRowState extends State<TimeInputsRow> {
  late final FocusNode firstFocusNode;
  late final FocusNode secondFocusNode;
  late final FocusNode thirdFocusNode;
  late final FocusNode fourthFocusNode;

  @override
  void initState() {
    super.initState();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TimeInputField(
          focusNode: firstFocusNode,
          formatterRegExp: '[0-2]',
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context).requestFocus(secondFocusNode);
            }
            widget.onChanged(TimeInputId.first, value);
          },
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          focusNode: secondFocusNode,
          formatterRegExp: '[0-9]',
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context).requestFocus(thirdFocusNode);
            }
            widget.onChanged(TimeInputId.second, value);
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.gray,
            ),
          ),
        ),
        TimeInputField(
          focusNode: thirdFocusNode,
          formatterRegExp: '[0-5]',
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context).requestFocus(fourthFocusNode);
            }
            widget.onChanged(TimeInputId.third, value);
          },
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          focusNode: fourthFocusNode,
          formatterRegExp: '[0-9]',
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              fourthFocusNode.unfocus();
            }
            widget.onChanged(TimeInputId.fourth, value);
          },
        ),
      ],
    );
  }
}
