import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../store/register_state.dart';
import '../../themes/app_colors.dart';
import '../home_screen/home_empty_screen.dart';
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
                        const Gap(12),
                        InkWell(
                          onTap: () => {
                            Navigator.pop(context),
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          'Register',
                          style: context.theme.bodyMedium
                              .copyWith(fontSize: 32, color: AppColors.white),
                        ),
                        const Gap(14),
                        Text(
                          'Username',
                          style: context.theme.headlineSmall
                              .copyWith(fontSize: 14),
                        ),
                        const Gap(8),
                        TextField(
                          cursorHeight: 20,
                          style: context.theme.bodyMedium.copyWith(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Enter your Username',
                          ),
                          onChanged: registerState.setUsername,
                        ),
                        const Gap(16),
                        Text(
                          'Password',
                          style: context.theme.headlineSmall
                              .copyWith(fontSize: 14),
                        ),
                        const Gap(8),
                        Observer(
                          builder: (context) {
                            return TextField(
                              cursorHeight: 20,
                              style: context.theme.bodyMedium.copyWith(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: '• • • • • • • • • • • •',
                                errorText: registerState.passwordError,
                              ),
                              onChanged: registerState.validatePassword,
                            );
                          },
                        ),
                        const Gap(16),
                        Text(
                          'Confirm Password',
                          style: context.theme.headlineSmall
                              .copyWith(fontSize: 14),
                        ),
                        const Gap(8),
                        Observer(
                          builder: (context) {
                            return TextField(
                              cursorHeight: 20,
                              style: context.theme.bodyMedium.copyWith(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: '• • • • • • • • • • • •',
                                errorText: registerState.confirmPasswordError,
                              ),
                              onChanged: registerState.passwordConfirmation,
                            );
                          },
                        ),
                        const Gap(24),
                        Observer(
                          builder: (_) => SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: registerState.isRegistrationEnabled
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen(),
                                        ),
                                      );
                                    }
                                  : null,
                              style: context.theme.elevatedButtonStyle,
                              child: Text(
                                'Register',
                                style: context.theme.headlineSmall
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
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
                                fontSize: 14,
                              ),
                            ).paddingOnly(bottom: 5),
                            const Expanded(
                              child: Divider(
                                color: AppColors.textFieldColor,
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(AppColors.primary),
                              side: MaterialStateProperty.all(
                                const BorderSide(color: AppColors.primary),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                                const Gap(8),
                                Text(
                                  'Register with Google',
                                  style: context.theme.headlineSmall
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(AppColors.primary),
                              side: MaterialStateProperty.all(
                                const BorderSide(color: AppColors.primary),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/apple.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                                const Gap(8),
                                Text(
                                  'Register with Apple',
                                  style: context.theme.headlineSmall
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ).paddingHorizontal(24),
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
