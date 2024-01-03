import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/consts/app_colors.dart';
import 'package:noti/consts/strings.dart';
import 'package:noti/presentation/login_screen/bloc/login_bloc.dart';
import 'package:noti/presentation/login_screen/widgets/inputs_row.dart';
import 'package:noti/presentation/login_screen/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  const InputsRow(),
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
