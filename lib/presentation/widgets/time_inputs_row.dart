import 'package:flutter/material.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/presentation/login_screen/bloc/login_bloc.dart';
import 'package:noti/presentation/widgets/time_input_field.dart';

class TimeInputsRow extends StatefulWidget {
  const TimeInputsRow({
    super.key,
    required this.onChanged,
    required this.hoursFirstDigitController,
    required this.hoursSecondDigitController,
    required this.minutesFirstDigitController,
    required this.minutesSecondDigitController,
  });

  final Function onChanged;
  final TextEditingController hoursFirstDigitController;
  final TextEditingController hoursSecondDigitController;
  final TextEditingController minutesFirstDigitController;
  final TextEditingController minutesSecondDigitController;

  @override
  State<TimeInputsRow> createState() => _TimeInputsRowState();
}

class _TimeInputsRowState extends State<TimeInputsRow> {
  late List<FocusNode> nodesList = [];

  @override
  void initState() {
    super.initState();
    nodesList = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var element in nodesList) {
      element.dispose();
    }
    super.dispose();
  }

  void _onChange(String value, int index) {
    if (value.trim().length == 2 && index < 3) {
      FocusScope.of(context).nextFocus();
    } else if (value.trim().length == 2 && index == 3) {
      nodesList[3].unfocus();
    }
    else if (value.length > 2) {
      FocusScope.of(context).nextFocus();
      String endSubstring = space + value.substring(2);
      String startSubstring = value.substring(0, 2);
      switch (index) {
        case 0:
          widget.onChanged(TimeInputId.first, startSubstring);
          widget.onChanged(TimeInputId.second, endSubstring);
          return;
        case 1:
          widget.onChanged(TimeInputId.second, startSubstring);
          widget.onChanged(TimeInputId.third, endSubstring);
          return;
        case 2:
          widget.onChanged(TimeInputId.third, startSubstring);
          widget.onChanged(TimeInputId.fourth, endSubstring);
          return;
        case 3:
          widget.onChanged(TimeInputId.fourth, startSubstring);
          return;
      }
    } else if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      switch (index) {
        case 1:
          widget.onChanged(TimeInputId.first, '\u200B');
          return;
        case 2:
          widget.onChanged(TimeInputId.second, '\u200B');
          return;
        case 3:
          widget.onChanged(TimeInputId.third, '\u200B');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TimeInputField(
          controller: widget.hoursFirstDigitController,
          focusNode: nodesList[0],
          formatterRegExp: RegExp(r'\u200B[0-2]{0,2}'),
          onChanged: (String value) {
            widget.onChanged(TimeInputId.first, value);
            _onChange(value, 0);
          },
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          controller: widget.hoursSecondDigitController,
          focusNode: nodesList[1],
          formatterRegExp: RegExp(r'\u200B[0-9]{0,2}'),
          onChanged: (String value) {
            widget.onChanged(TimeInputId.second, value);
            _onChange(value, 1);
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
          controller: widget.minutesFirstDigitController,
          focusNode: nodesList[2],
          formatterRegExp: RegExp(r'\u200B[0-5]{0,2}'),
          onChanged: (String value) {
            widget.onChanged(TimeInputId.third, value);
            _onChange(value, 2);
          },
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          controller: widget.minutesSecondDigitController,
          focusNode: nodesList[3],
          formatterRegExp: RegExp(r'\u200B[0-9]{0,2}'),
          onChanged: (String value) {
            widget.onChanged(TimeInputId.fourth, value);
            _onChange(value, 3);
          },
        ),
      ],
    );
  }
}
