import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/consts/time_input_id.dart';
import 'package:noti/presentation/login_screen/bloc/login_bloc.dart';
import 'package:noti/presentation/login_screen/widgets/error_message.dart';
import 'package:noti/presentation/widgets/big_filled_button.dart';
import 'package:noti/presentation/widgets/inputs_row.dart';
import 'package:noti/presentation/notifications_screen/notifications_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController hoursFirstDigitController;
  late final TextEditingController hoursSecondDigitController;
  late final TextEditingController minutesFirstDigitController;
  late final TextEditingController minutesSecondDigitController;

  @override
  void initState() {
    super.initState();
    hoursFirstDigitController = TextEditingController();
    hoursSecondDigitController = TextEditingController();
    minutesFirstDigitController = TextEditingController();
    minutesSecondDigitController = TextEditingController();
  }

  @override
  void dispose() {
    hoursFirstDigitController.dispose();
    hoursSecondDigitController.dispose();
    minutesFirstDigitController.dispose();
    minutesSecondDigitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hoursFirstDigitController.text = state.hoursFirstDigit;
            hoursSecondDigitController.text = state.hoursSecondDigit;
            minutesFirstDigitController.text = state.minutesFirstDigit;
            minutesSecondDigitController.text = state.minutesSecondDigit;
          });

          if (state.isConfirmed == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            );
          }
        },
        child: Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.only(top: 96),
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
                    TimeInputsRow(
                        hoursFirstDigitController: hoursFirstDigitController,
                        hoursSecondDigitController: hoursSecondDigitController,
                        minutesFirstDigitController:
                            minutesFirstDigitController,
                        minutesSecondDigitController:
                            minutesSecondDigitController,
                        onChanged: (TimeInputId id, String value) {
                          context.read<LoginBloc>().add(InputChangedEvent(
                              inputId: id, inputValue: value));
                        }),
                    Expanded(child: Container()),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: state.isErrorVisible ? 1 : 0,
                      child: const ErrorMessage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 16),
                      child: BigFilledButton(
                        text: Strings.loginPageStrings.buttonText,
                        onPressed: state.isConfirmButtonEnabled
                            ? () {
                                context
                                    .read<LoginBloc>()
                                    .add(ConfirmButtonClickedEvent());
                              }
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
