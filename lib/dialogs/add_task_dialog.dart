import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../themes/app_colors.dart';
import '../widgets/calendar.dart';

class AddTaskDialog {
  Future<void> dialogBuilder(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: AppColors.bottomNavBar,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(14),
                Text(
                  'Add Task',
                  style: context.theme.headlineMedium,
                ),
                const Gap(14),
                TextField(
                  // cursorHeight: 20,
                  style: context.theme.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'What do you want to do?',
                    fillColor: Colors.transparent,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldColor),
                    ),
                  ),
                ),
                const Gap(20),
                TextField(
                  // cursorHeight: 20,
                  style: context.theme.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'What do you want to do?',
                    fillColor: Colors.transparent,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldColor),
                    ),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        log(5);
                        CalendarDialog().dialogBuilder(context);
                      },
                      child: SvgPicture.asset('assets/icons/task_timer.svg'),
                    ),
                    const Gap(32),
                    GestureDetector(
                      onTap: () {
                        // Handle the tap on the second icon (task_tag)
                      },
                      child: SvgPicture.asset('assets/icons/task_tag.svg'),
                    ),
                    const Gap(32),
                    GestureDetector(
                      onTap: () {
                        // Handle the tap on the third icon (task_flag)
                      },
                      child: SvgPicture.asset('assets/icons/task_flag.svg'),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Handle the tap on the last icon (task_send)
                      },
                      child: SvgPicture.asset('assets/icons/task_send.svg'),
                    ),
                  ],
                ),
              ],
            ).paddingOnly(left: 20, right: 20, bottom: 17),
          ),
        ).paddingOnly(bottom: MediaQuery.of(context).viewInsets.bottom);
      },
    );
  }
}
