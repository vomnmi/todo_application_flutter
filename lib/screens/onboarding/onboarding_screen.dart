import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../themes/app_colors.dart';
import '../welcome_screen.dart';
import 'onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => {
                  navigateToWelcomeScreen(),
                },
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(BorderSide.none),
                  textStyle: MaterialStatePropertyAll(
                    GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
                child: const Text('SKIP'),
              ),
            ),
            SizedBox(
              height: 277,
              child: PageView.builder(
                controller: pageController,
                itemCount: contents.length,
                onPageChanged: (i) {
                  setState(() {
                    current = i;
                  });
                },
                itemBuilder: (_, i) {
                  // ignore: sized_box_for_whitespace
                  return SvgPicture.asset(
                    contents[i].image,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            const Gap(50),
            DotsIndicator(
              dotsCount: 3,
              position: current,
              onTap: (position) => {
                setState(() {
                  current = position;
                  pageController.animateToPage(
                    position,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }),
              },
              decorator: DotsDecorator(
                spacing: const EdgeInsets.symmetric(horizontal: 8),
                activeColor: AppColors.white,
                size: const Size(26, 4),
                activeSize: const Size(26, 4),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
              ),
            ),
            const Gap(50),
            Text(
              contents[current].title,
              style: context.theme.bodyLarge,
            ),
            const Gap(42),
            Text(
              contents[current].description,
              textAlign: TextAlign.center,
              style: context.theme.headlineSmall,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => {
                      if (current > 0)
                        {
                          pageController.animateToPage(
                            current - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOut,
                          ),
                        },
                    },
                    style: ButtonStyle(
                      side: const MaterialStatePropertyAll(BorderSide.none),
                      textStyle: MaterialStatePropertyAll(
                        GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                    child: const Text('BACK'),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: current == contents.length - 1 ? 150 : 90,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => {
                        if (current < contents.length - 1)
                          {
                            pageController.animateToPage(
                              current + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            ),
                          }
                        else
                          {
                            navigateToWelcomeScreen(),
                          },
                      },
                      style: context.theme.elevatedButtonStyle,
                      child: Text(
                        current == contents.length - 1 ? 'GET STARTED' : 'NEXT',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(bottom: 15),
      ),
    );
  }

  void navigateToWelcomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }
}
