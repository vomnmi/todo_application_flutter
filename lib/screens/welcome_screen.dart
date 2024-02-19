import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../themes/app_colors.dart';
import 'login_register/login_screen.dart';
import 'login_register/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => {
                  Navigator.pop(context),
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 24,
                ),
              ).paddingOnly(left: 24, top: 25),
            ),
            const Gap(58),
            Text(
              'Welcome to UpTodo',
              style: context.theme.bodyLarge,
            ),
            const Gap(26),
            const Text(
              'Please login to your account or create\n new account to continue',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: context.theme.elevatedButtonStyle,
                    child: Text(
                      'LOGIN',
                      style: context.theme.headlineSmall,
                    ),
                  ),
                ),
                const Gap(28),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      overlayColor: MaterialStatePropertyAll(AppColors.primary),
                      side: MaterialStatePropertyAll(
                        BorderSide(color: AppColors.primary),
                      ),
                    ),
                    child: Text(
                      'CREATE ACCOUNT',
                      style: context.theme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(),
          ],
        ),
      ),
    );
  }
}
