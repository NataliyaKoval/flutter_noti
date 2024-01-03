import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/presentation/login_screen/bloc/login_bloc.dart';
import 'package:noti/presentation/login_screen/widgets/time_input_field.dart';

class InputsRow extends StatefulWidget {
  const InputsRow({super.key});

  @override
  State<InputsRow> createState() => _InputsRowState();
}

class _InputsRowState extends State<InputsRow> {
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
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context)
                  .requestFocus(secondFocusNode);
            }
            context.read<LoginBloc>().add(InputChangedEvent(
              inputId: 'firstInput',
              inputValue: value,
            ));
          },
          focusNode: firstFocusNode,
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context).requestFocus(thirdFocusNode);
            }
            context.read<LoginBloc>().add(InputChangedEvent(
              inputId: 'secondInput',
              inputValue: value,
            ));
          },
          focusNode: secondFocusNode,
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
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              FocusScope.of(context)
                  .requestFocus(fourthFocusNode);
            }
            context.read<LoginBloc>().add(InputChangedEvent(
              inputId: 'thirdInput',
              inputValue: value,
            ));
          },
          focusNode: thirdFocusNode,
        ),
        const SizedBox(
          width: 12,
        ),
        TimeInputField(
          onChanged: (String value) {
            if (value.trim().isNotEmpty) {
              fourthFocusNode.unfocus();
            }
            context.read<LoginBloc>().add(InputChangedEvent(
              inputId: 'fourthInput',
              inputValue: value,
            ));
          },
          focusNode: fourthFocusNode,
        ),
      ],
    );
  }
}
