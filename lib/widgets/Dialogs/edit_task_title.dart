import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../models/task_model/task_model.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';

class EditTaskTitle extends StatelessWidget {
  final int index;
  EditTaskTitle({
    super.key,
    required this.index,
  });
  HomeState state = HomeState();
  TaskModel get taskModel => state.tasks[index];
  late final textFieldController = TextEditingController(text: taskModel.title);
  late final textFieldController1 =
      TextEditingController(text: taskModel.description);

  void onEdit(BuildContext context) {
    final editedTask = state.tasks[index].copyWith(
      title: textFieldController.text,
      description: textFieldController1.text,
    );
    state.editTask(editedTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.bottomNavBar,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(10),
            Text(
              'Edit Task',
              style: GoogleFonts.lato(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
            const Gap(15),
            const Divider(),
            const Gap(15),
            TextField(
              controller: textFieldController,
              // cursorHeight: 20,
              style: context.theme.bodyMedium.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
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
            ).paddingHorizontal(),
            const Gap(20),
            TextField(
              controller: textFieldController1,
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
            ).paddingHorizontal(),
            const Gap(15),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
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
                const Gap(10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onEdit(context);
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.lato(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 8),
          ],
        ),
      ),
    );
  }
}
