import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../models/task_model/task_model.dart';
import '../store/home_state/home_state.dart';
import '../themes/app_colors.dart';
import '../widgets/Dialogs/delete_task_dialog.dart';
import '../widgets/Dialogs/edit_category.dart';
import '../widgets/Dialogs/edit_date.dart';
import '../widgets/Dialogs/edit_priority.dart';
import '../widgets/Dialogs/edit_task_title.dart';
import '../widgets/category_on_taskCard.dart';
import '../widgets/priority_on_taskCard.dart';

class EditTask extends StatefulWidget {
  final int index;
  final bool isChecked;
  final void Function(bool) onCheckboxChanged;

  const EditTask({
    super.key,
    required this.index,
    required this.isChecked,
    required this.onCheckboxChanged,
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late bool isChecked;
  final state = HomeState();
  TaskModel get taskModel => state.tasks[widget.index];

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.editTaskButton,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: AppColors.editTaskButton,
                  borderRadius: BorderRadius.circular(4),
                ),
                // child: SvgPicture.asset('assets/icons/repeat.svg'),
                child: GestureDetector(
                  onTap: onRepeat,
                  child: const Icon(
                    Icons.repeat_rounded,
                    color: AppColors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const Gap(30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
                height: 28,
                child: Checkbox(
                  visualDensity: VisualDensity.comfortable,
                  checkColor: Colors.white,
                  fillColor:
                      const MaterialStatePropertyAll(AppColors.bottomNavBar),
                  value: widget.isChecked,
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
              const Gap(21),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Observer(
                            builder: (context) {
                              return Text(
                                taskModel.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: context.theme.headlineMedium,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (taskModel.description != null)
                      Observer(
                        builder: (context) {
                          return Text(
                            taskModel.description!,
                            style: context.theme.headlineSmall
                                .copyWith(color: AppColors.grey),
                          ).paddingOnly(top: 10);
                        },
                      ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: editTitle,
                child: SvgPicture.asset(
                  'assets/icons/edit_text.svg',
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
          const Gap(38),
          Row(
            children: [
              SvgPicture.asset('assets/icons/timer.svg'),
              const Gap(8),
              Text(
                'Task Time: ',
                style: context.theme.headlineSmall,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.21),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Observer(
                  builder: (context) {
                    return GestureDetector(
                      onTap: editDate,
                      child: Text(
                        taskModel.getIsToday
                            ? 'Today At ${taskModel.time!.hour}:${taskModel.time!.minute}'
                            : '${DateFormat('dd.MM.yy').format(taskModel.date!.toLocal())} At ${taskModel.time!.hour}:${taskModel.time!.minute}',
                        style: context.theme.bodyMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Gap(31),
          Row(
            children: [
              SvgPicture.asset('assets/icons/task_tag.svg'),
              const Gap(8),
              Text(
                'Task Category: ',
                style: context.theme.headlineSmall,
              ),
              const Spacer(),
              Observer(
                builder: (context) {
                  return GestureDetector(
                    onTap: editCategory,
                    child: CategoryOnTaskCard(
                      categoryModel: taskModel.category!,
                      backgroundColor: Colors.white.withOpacity(0.21),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9.5,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(31),
          Row(
            children: [
              SvgPicture.asset('assets/icons/task_flag.svg'),
              const Gap(8),
              Text(
                'Task Priority: ',
                style: context.theme.headlineSmall,
              ),
              const Spacer(),
              Observer(
                builder: (context) {
                  return GestureDetector(
                    onTap: editPriority,
                    child: PriorityOnTaskCard(
                      priorityModel: taskModel.priority!,
                      backgroundColor: Colors.white.withOpacity(0.21),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      showBorder: false,
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(31),
          GestureDetector(
            onTap: onDelete,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/trash.svg'),
                const Gap(11),
                Text(
                  'Delete Task',
                  style: context.theme.headlineSmall
                      .copyWith(color: AppColors.deleteTaskButton),
                ),
              ],
            ),
          ),
        ],
      ).paddingOnly(left: 24, right: 24, top: 35),
    );
  }

  Future<dynamic> editTitle() async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditTaskTitle(index: widget.index);
      },
    );
  }

  Future<void> onDelete() async {
    final res = await deleteTask();
    if (res ?? false) {
      Navigator.pop(context);
      await Future.delayed(const Duration(milliseconds: 500), () {
        state.deleteTask(state.tasks[widget.index]);
      });
    }
  }

  Future<bool?> deleteTask() async {
    return showDialog(
      context: context,
      builder: (context) {
        return DeleteTaskDialog(
          onConfirm: () {
            var count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        );
      },
    );
  }

  Future<dynamic> editCategory() async {
    await showDialog<dynamic>(
      // backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return EditCategory(
          index: widget.index,
        );
      },
    );
  }

  Future<dynamic> editPriority() async {
    await showDialog<dynamic>(
      // backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return EditPriority(
          index: widget.index,
        );
      },
    );
  }

  void setTime(Time time) {
    state.setTime(time);
    Navigator.pop(context);
  }

  Future<dynamic> editDate() async {
    await showDialog<dynamic>(
      // backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return EditDate(
          index: widget.index,
        );
      },
    );
  }

  Future<void> onRepeat() async {
    state.repeatTask(taskModel);
    Navigator.pop(context);
  }
}
