import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../store/register_state.dart';
import '../../themes/app_colors.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerState = RegisterState();
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
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(20),
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
                          'Register',
                          style: context.theme.bodyLarge,
                        ),
                        const Gap(20),
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
                          onChanged: registerState.setUsername,
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
                                errorText: registerState.passwordError,
                              ),
                              onChanged: registerState.validatePassword,
                            );
                          },
                        ),
                        const Gap(25),
                        Text(
                          'Confirm Password',
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
                                errorText: registerState.confirmPasswordError,
                              ),
                              onChanged: registerState.passwordConfirmation,
                            );
                          },
                        ),
                        const Gap(40),
                        Observer(
                          builder: (_) => SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: registerState.isRegistrationEnabled
                                  ? () {
                                      // Handle login button press here
                                    }
                                  : null,
                              style: context.theme.elevatedButtonStyle,
                              child: Text(
                                'Register',
                                style: context.theme.headlineSmall,
                              ),
                            ),
                          ),
                        ),
                        const Gap(19),
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
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(AppColors.primary),
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
                                  'Register with Google',
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
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(AppColors.primary),
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
                                  'Register with Apple',
                                  style: context.theme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ).paddingHorizontal(),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account?  ',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: AppColors.textGrey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).paddingOnly(bottom: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
