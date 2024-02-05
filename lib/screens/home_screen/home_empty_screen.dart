import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// import 'package:get/get.dart';

import '../../dialogs/add_task_dialog.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../models/nav_bar_item.dart';
import '../../themes/app_colors.dart';

class EmptyHomeScreen extends StatefulWidget {
  const EmptyHomeScreen({super.key});

  @override
  State<EmptyHomeScreen> createState() => _EmptyHomeScreenState();
}

class _EmptyHomeScreenState extends State<EmptyHomeScreen> {
  int _currentIndex = 0;
  AddTaskDialog dialog = AddTaskDialog();

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
                    'What do you want to do today?',
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
          onPressed: () {
            dialog.dialogBuilder(context);
          },
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColors.bottomNavBar,
          height: 81,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                  child: Column(
                    children: [
                      const Gap(10),
                      SvgPicture.asset(
                        _currentIndex == i
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
          ),
        ),
      ),
    );
  }
}
