import 'dart:developer';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../store/home_state/home_state.dart';
import '../themes/app_colors.dart';
import '../widgets/task_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  HomeState state = HomeState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const Gap(13),
            Text(
              'Calendar',
              style: context.theme.bodyLarge.copyWith(fontSize: 20),
            ),
            const Gap(16),
            Container(
              width: double.infinity,
              color: AppColors.bottomNavBar,
              child: Observer(
                builder: (context) {
                  return CalendarTimeline(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023, 1, 2),
                    lastDate: DateTime(2025, 12, 31),
                    onDateSelected: (date) {
                      state.searchDate = date;
                      log(state.isToday(first: date).toString());
                      state.toggleIsToday(
                        !state.isToday(first: date)
                            ? null
                            : state.isToday(first: date),
                      );
                      state.dateFilter();
                    },
                    leftMargin: 20,
                    monthColor: Colors.white,
                    dayColor: AppColors.white,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: AppColors.purple,
                    dotsColor: AppColors.white,
                  );
                },
              ),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.darkGrey,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            state.isTodaySelected = true;
                            state.searchDate = DateTime.now();
                            state.dateFilter();
                            setState(() {});
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return state.isTodaySelected != null &&
                                      state.isTodaySelected!
                                  ? AppColors.purple
                                  : Colors.transparent;
                            }),
                          ),
                          child: Text(
                            state.isTodaySelected ?? false ? 'Today' : 'Today',
                            style: context.theme.headlineSmall,
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(32),
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            state.toggleIsToday(false);
                            state.dateFilter();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return state.isTodaySelected != null &&
                                      !state.isTodaySelected!
                                  ? AppColors.purple
                                  : Colors.transparent;
                            }),
                          ),
                          child: Text(
                            state.isTodaySelected ?? false
                                ? 'Completed'
                                : 'Completed',
                            style: context.theme.headlineSmall,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.separated(
                    itemCount: state.foundTask.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) {
                      return TaskCard(
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
