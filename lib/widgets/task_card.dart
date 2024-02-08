import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../themes/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 72,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.bottomNavBar,
          ),
          child: Row(
            children: [
              const Gap(10),
              Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                shape: const CircleBorder(),
                activeColor: AppColors.bottomNavBar,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: AppColors.white),
                ),
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              const Gap(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do Math Homework',
                    style: context.theme.headlineSmall
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const Gap(6),
                  Text(
                    'Today At 16:45',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ).paddingOnly(top: 12),
            ],
          ),
        ).paddingHorizontal(24),
      ),
    );
  }
}
