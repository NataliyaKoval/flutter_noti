import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/login_screen/bloc/login_bloc.dart';
import 'package:noti/presentation/login_screen/widgets/primary_button.dart';
import 'package:noti/presentation/login_screen/widgets/time_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.eerieBlack,
        toolbarHeight: 44,
        centerTitle: true,
        title: Text(Strings.loginPageStrings.title),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            top: 96,
            left: 16,
            right: 16,
          ),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    Strings.loginPageStrings.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    Strings.loginPageStrings.hint,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.sonicSilver,
                    ),
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  Text(
                    state.currentTime,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  Row(
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
                  ),
                  Expanded(child: Container()),
                  PrimaryButton(
                    text: Strings.loginPageStrings.buttonText,
                    onPressed: state.isConfirmButtonActive ? () {} : null,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
