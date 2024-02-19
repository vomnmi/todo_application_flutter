import 'dart:developer';

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../models/task_model/task_model.dart';
import '../../models/time_model/time_model.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';

// ignore: must_be_immutable
class EditDate extends StatelessWidget {
  final int index;
  EditDate({
    super.key,
    required this.index,
  });
  HomeState state = HomeState();
  TaskModel get taskModel => state.tasks[index];
  DateRangePickerController controller = DateRangePickerController();

  void onEdit(BuildContext context) {
    final editedTask = state.tasks[index].copyWith(
      date: controller.selectedDate,
    );
    state.editTask(editedTask);
    Navigator.pop(context);
    log('onEdit function is called');
  }

  void onTimeEdit(Time time) {
    final editedTask = state.tasks[index].copyWith(
      time: TimeModel(
        hour: time.hour < 10 ? '0${time.hour}' : '${time.hour}',
        minute: time.minute <= 9 ? '0${time.minute}' : '${time.minute}',
      ),
    );
    state.editTask(editedTask);
    log('onEdit function is called');
  }

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
                    onPressed: () async {
                      await Navigator.of(context).push(
                        showPicker(
                          value: Time(hour: 0, minute: 00),
                          onChange: onTimeEdit,
                          accentColor: AppColors.primary,
                          themeData: ThemeData.dark(),
                          iosStylePicker: true,
                        ),
                      );
                      onEdit(context);
                    },
                    child: Text(
                      'Edit Time',
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
    ).paddingSymmetric(vertical: 200);
  }
}
