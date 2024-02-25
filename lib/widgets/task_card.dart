import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../models/task_model/task_model.dart';
import '../screens/edit_task.dart';
import '../store/home_state/home_state.dart';
import '../themes/app_colors.dart';
import 'category_on_taskCard.dart';
import 'priority_on_taskCard.dart';

class TaskCard extends StatefulWidget {
  final int index;
  final void Function(bool) onCheckboxChanged;

  const TaskCard({
    super.key,
    required this.index,
    required this.onCheckboxChanged,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;
  final state = HomeState();

  TaskModel get taskModel => state.foundTask[widget.index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(state.tasks.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditTask(
              index: widget.index,
              isChecked: isChecked,
              onCheckboxChanged: widget.onCheckboxChanged,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        // padding: const EdgeInsets.only(left: 10, top: 12, bottom: 4, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.bottomNavBar,
        ),
        child: Row(
          children: [
            const Gap(10),
            SizedBox(
              height: 16,
              width: 16,
              child: Checkbox(
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
                    widget.onCheckboxChanged(value);
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                taskModel.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: context.theme.headlineSmall.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(6),
                        if (taskModel.date != null)
                          Text(
                            taskModel.getIsToday
                                ? 'Today \nAt ${taskModel.time!.hour}:${taskModel.time!.minute}'
                                : '${DateFormat('dd.MM.yy').format(taskModel.date!.toLocal())} \nAt ${taskModel.time!.hour}:${taskModel.time!.minute}',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                      ],
                    ).paddingOnly(bottom: 12),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CategoryOnTaskCard(categoryModel: taskModel.category!),
                      const Gap(12),
                      PriorityOnTaskCard(priorityModel: taskModel.priority!),
                    ],
                  ),
                ],
              ).paddingOnly(left: 10, top: 12, bottom: 4, right: 10),
            ),
          ],
        ),
      ),
    );
  }
}
