import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../extensions/widget_extension.dart';
import '../models/nav_bar_item.dart';
import '../screens/calendar_screen.dart';
import '../screens/home_screen/home_empty_screen.dart';
import '../store/home_state/home_state.dart';
import '../themes/app_colors.dart';
import 'Dialogs/category_dialog.dart';
import 'Dialogs/priority_dialog.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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

  Widget getBody() {
    switch (state.currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CalendarScreen();

      default:
        return const HomeScreen();
    }
  }

  void setTime(time) {
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
            state.createTask(_dateRangePickerController.selectedDate);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return getBody();
        },
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
                for (var i = 0; i < items.length; i++)
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
    );
  }
}
