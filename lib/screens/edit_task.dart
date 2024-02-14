import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../models/task_model/task_model.dart';
import '../themes/app_colors.dart';
import '../widgets/category_on_taskCard.dart';
import '../widgets/priority_on_taskCard.dart';

class EditTask extends StatefulWidget {
  final TaskModel taskModel;
  final bool isChecked;
  final void Function(bool) onCheckboxChanged;
  const EditTask({
    super.key,
    required this.taskModel,
    required this.isChecked,
    required this.onCheckboxChanged,
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late bool isChecked;

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
                child: const Icon(
                  Icons.repeat_rounded,
                  color: AppColors.white,
                  size: 24,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.taskModel.title,
                    style: context.theme.headlineMedium,
                  ),
                  const Gap(10),
                  Text(
                    widget.taskModel.description!,
                    style: context.theme.headlineSmall
                        .copyWith(color: AppColors.grey),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/edit_text.svg',
                width: 28,
                height: 28,
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
                child: Text(
                  widget.taskModel.getIsToday
                      ? 'Today At ${widget.taskModel.time!.hour} : ${widget.taskModel.time!.minute}'
                      : DateFormat('dd.MM').format(
                          widget.taskModel.date!.toLocal(),
                        ),
                  style: context.theme.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
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
              CategoryOnTaskCard(
                categoryModel: widget.taskModel.category!,
                backgroundColor: Colors.white.withOpacity(0.21),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 9.5),
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
              PriorityOnTaskCard(
                priorityModel: widget.taskModel.priority!,
                backgroundColor: Colors.white.withOpacity(0.21),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                showBorder: false,
              ),
            ],
          ),
        ],
      ).paddingOnly(left: 24, right: 24, top: 35),
    );
  }
}