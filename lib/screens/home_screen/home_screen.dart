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
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/Dialogs/category_dialog.dart';
import '../../widgets/Dialogs/exit_dialog.dart';
import '../../widgets/Dialogs/priority_dialog.dart';
import '../../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeState state = HomeState();

  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  void setTime(Time time) {
    state.setTime(time);
    Navigator.pop(context);
  }

  Future<dynamic> exitApp() async {
    await showDialog<dynamic>(
      // backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return const ExitApp();
      },
    );
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
            state.createTask(_dateRangePickerController.selectedDate);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTask,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ).paddingOnly(bottom: 10),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  'ToDo',
                  style: context.theme.headlineMedium,
                ),
                GestureDetector(
                  onTap: exitApp,
                  child: Image.asset(
                    'assets/icons/exit.png',
                    height: 24,
                    color: AppColors.white.withOpacity(0.87),
                  ),
                ),
              ],
            ).paddingOnly(top: 15, left: 20, right: 20),
            const Gap(16),
            Observer(
              builder: (context) {
                return TextField(
                  cursorHeight: 24,
                  cursorWidth: 1,
                  style: context.theme.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                  onChanged: state.runFilter,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: ' Search for your task...',
                  ),
                ).paddingHorizontal(24);
              },
            ),
            const Gap(20),
            Expanded(
              child: Observer(
                builder: (context) {
                  if (state.tasks.isNotEmpty) {
                    return ListView.separated(
                      itemCount: state.foundTask.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        return TaskCard(
                          index: index,
                        ).paddingOnly(
                          bottom: index == state.foundTask.length - 1 ? 35 : 0,
                        );
                      },
                    );
                  }
                  return Center(
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
              textStyle:
                  context.theme.displayMedium.copyWith(color: AppColors.white),
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
    ).paddingSymmetric(vertical: 210);
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
