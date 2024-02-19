import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../store/login_state.dart';
import '../../themes/app_colors.dart';
import '../home_screen/home_empty_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginState = LoginState();
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          //here
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => {
                  Navigator.pop(context),
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const Gap(24),
              Text(
                'Login',
                style: context.theme.bodyLarge,
              ),
              const Gap(53),
              Text(
                'Username',
                style: context.theme.headlineSmall,
              ),
              const Gap(8),
              TextField(
                cursorHeight: 24,
                style: context.theme.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter your Username',
                ),
                onChanged: loginState.setUsername,
              ),
              const Gap(25),
              Text(
                'Password',
                style: context.theme.headlineSmall,
              ),
              const Gap(8),
              Observer(
                builder: (context) {
                  return TextField(
                    cursorHeight: 24,
                    style: context.theme.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: '• • • • • • • • • • • •',
                      errorText: loginState.passwordError,
                    ),
                    onChanged: loginState.validatePassword,
                    obscureText: true,
                  );
                },
              ),
              const Gap(50),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: loginState.isLoginEnabled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmptyHomeScreen(),
                              ),
                            );
                          }
                        : null,
                    style: context.theme.elevatedButtonStyle,
                    child: Text(
                      'Login',
                      style: context.theme.headlineSmall,
                    ),
                  ),
                ),
              ),
              const Gap(31),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.textFieldColor,
                    ),
                  ),
                  Text(
                    ' or ',
                    style: GoogleFonts.lato(
                      color: AppColors.textFieldColor,
                      fontSize: 16,
                    ),
                  ).paddingOnly(bottom: 5),
                  const Expanded(
                    child: Divider(
                      color: AppColors.textFieldColor,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    overlayColor: MaterialStatePropertyAll(AppColors.primary),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: AppColors.primary),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/google.svg',
                        fit: BoxFit.fitHeight,
                      ),
                      const Gap(10),
                      Text(
                        'Login with Google',
                        style: context.theme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    overlayColor: MaterialStatePropertyAll(AppColors.primary),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: AppColors.primary),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/apple.svg',
                        fit: BoxFit.fitHeight,
                      ),
                      const Gap(10),
                      Text(
                        'Login with Apple',
                        style: context.theme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: AppColors.textGrey,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(vertical: 25),
        ),
      ),
    );
  }
}
