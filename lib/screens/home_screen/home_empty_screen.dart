import 'dart:developer';

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../models/nav_bar_item.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/category_dialog.dart';
import '../../widgets/priority_dialog.dart';

class EmptyHomeScreen extends StatefulWidget {
  const EmptyHomeScreen({super.key});

  @override
  State<EmptyHomeScreen> createState() => _EmptyHomeScreenState();
}

class _EmptyHomeScreenState extends State<EmptyHomeScreen> {
  final HomeState state = HomeState();

  List<NavBarItem> items = [
    NavBarItem(
      iconPath: 'assets/icons/home-2.svg',
      selectedIconPath: 'assets/icons/home_icon.svg',
      title: 'Home',
    ),
    NavBarItem(
      iconPath: 'assets/icons/calendar_icon.svg',
      selectedIconPath: 'assets/icons/calendar_selected.svg',
      title: 'Calendar',
    ),
    NavBarItem(
      selectedIconPath: 'assets/icons/focus_selected.svg',
      iconPath: 'assets/icons/focus_icon.svg',
      title: 'Focus',
    ),
    NavBarItem(
      selectedIconPath: 'assets/icons/profile_icon.svg',
      iconPath: 'assets/icons/profile_icon.svg',
      title: 'Profile',
    ),
  ];

  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  void setTime(Time time) {
    state.setTime(time);
    Navigator.pop(context);
  }

  Future<dynamic> showCalendar() async {
    await showModalBottomSheet<dynamic>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CalendarBottomSheet(
          controller: _dateRangePickerController,
          onChooseTime: () {
            Navigator.of(context).push(
              showPicker(
                value: Time(hour: 0, minute: 00),
                onChange: setTime,
                accentColor: AppColors.primary,
                themeData: ThemeData.dark(),
                iosStylePicker: true,
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> showCategories() async {
    await showDialog<dynamic>(
      // backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return CategoryDialog(
          onAdd: state.setCategory,
        );
      },
    );
  }

  Future<dynamic> showPriorities() async {
    await showDialog<dynamic>(
      context: context,
      builder: (context) {
        return PriorityDialog(
          onSelectingPriority: state.setPriority,
        );
      },
    );
  }

  Future<void> showAddTask() async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddTaskDialog(
          onTitleChanged: (val) => state.title = val,
          onDescriptionChanged: (val) => state.description = val,
          onShowCalendar: showCalendar,
          onShowCategories: showCategories,
          onShowPriorities: showPriorities,
          onSendTask: () {
            log(state.title.toString());
            log(state.description.toString());
            log(_dateRangePickerController.selectedDate.toString());
            log(state.time.toString());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/filter.svg',
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  'Index',
                  style: context.theme.headlineMedium,
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.grey,
                  backgroundImage: AssetImage('assets/icons/profile_pic.png'),
                ),
              ],
            ).paddingOnly(top: 15, left: 20, right: 20),
            const Gap(70),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/illustrations/home_screen.svg',
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    'What do you want to do?',
                    style: context.theme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(10),
                  Text(
                    'Tap + to add your tasks',
                    style: context.theme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTask,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColors.bottomNavBar,
          height: 81,
          child: Observer(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () {
                        state.currentIndex = i;
                      },
                      child: Column(
                        children: [
                          const Gap(10),
                          SvgPicture.asset(
                            state.currentIndex == i
                                ? items[i].selectedIconPath
                                : items[i].iconPath,
                            height: 30,
                          ),
                          Text(items[i].title),
                        ],
                      ).paddingOnly(
                        right: i == 1 ? 15 : 0,
                        left: i == 2 ? 15 : 0,
                      ),
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

class CalendarBottomSheet extends StatelessWidget {
  final DateRangePickerController controller;
  final VoidCallback onChooseTime;

  const CalendarBottomSheet({
    super.key,
    required this.controller,
    required this.onChooseTime,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.bottomNavBar,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfDateRangePicker(
            backgroundColor: AppColors.bottomNavBar,
            selectionColor: AppColors.purple,
            selectionRadius: 20,
            toggleDaySelection: true,
            showNavigationArrow: true,
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: context.theme.displayMedium,
            ),
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
            minDate: DateTime(2020),
            maxDate: DateTime(2030),
            initialDisplayDate: DateTime.now(),
            controller: controller,
            onCancel: () {
              controller.selectedDate = null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  style: const ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide.none),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.lato(
                      color: AppColors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onChooseTime,
                    child: Text(
                      'Choose Time',
                      style: context.theme.headlineSmall
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).paddingHorizontal(8),
    ).paddingOnly(top: 274, bottom: 212, left: 24, right: 24);
  }
}

class AddTaskDialog extends StatelessWidget {
  final Function(String) onTitleChanged;
  final Function(String) onDescriptionChanged;
  final VoidCallback onShowCalendar;
  final VoidCallback onShowCategories;
  final VoidCallback onShowPriorities;
  final VoidCallback onSendTask;

  const AddTaskDialog({
    super.key,
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onShowCalendar,
    required this.onShowCategories,
    required this.onShowPriorities,
    required this.onSendTask,
  });

  @override
  Widget build(BuildContext context) {
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
              onChanged: onTitleChanged,
              decoration: const InputDecoration(
                hintText: 'Task',
                fillColor: Colors.transparent,
                isDense: true,
                contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFieldColor),
                ),
              ),
            ),
            const Gap(20),
            TextField(
              onChanged: onDescriptionChanged,
              style: context.theme.bodyMedium.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: 'Description',
                fillColor: Colors.transparent,
                isDense: true,
                contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
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
                  onTap: onShowCalendar,
                  child: SvgPicture.asset('assets/icons/task_timer.svg'),
                ),
                const Gap(32),
                GestureDetector(
                  onTap: onShowCategories,
                  child: SvgPicture.asset('assets/icons/task_tag.svg'),
                ),
                const Gap(32),
                GestureDetector(
                  onTap: onShowPriorities,
                  child: SvgPicture.asset('assets/icons/task_flag.svg'),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onSendTask,
                  child: SvgPicture.asset('assets/icons/task_send.svg'),
                ),
              ],
            ),
          ],
        ).paddingOnly(left: 20, right: 20, bottom: 17),
      ),
    ).paddingOnly(bottom: MediaQuery.of(context).viewInsets.bottom);
  }
}
