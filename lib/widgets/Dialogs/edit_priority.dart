import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../lists/priority_list.dart';
import '../../models/task_model/task_model.dart';
import '../../store/home_state/home_state.dart';
import '../../store/priority_state.dart';
import '../../themes/app_colors.dart';
import '../priority_card.dart';

class EditPriority extends StatefulWidget {
  final int index;
  const EditPriority({super.key, required this.index});

  @override
  State<EditPriority> createState() => _EditPriorityState();
}

class _EditPriorityState extends State<EditPriority> {
  final PriorityState _priorityState = PriorityState();

  final HomeState state = HomeState();

  TaskModel get taskModel => state.tasks[widget.index];

  @override
  void initState() {
    super.initState();
    _priorityState.selectedPriorityIndex =
        state.tasks[widget.index].priority?.priorityNumber ?? -1;
  }

  void onEdit(BuildContext context) {
    final editedTask = state.tasks[widget.index]
        .copyWith(priority: priorities[_priorityState.selectedPriorityIndex]);
    state.editTask(editedTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
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
                'Edit Task Priority',
                style: GoogleFonts.lato(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: -0.5,
                  decoration: TextDecoration.none,
                ),
              ),
              const Gap(10),
              const Divider(),
              const Gap(22),
              Wrap(
                spacing: 20,
                runSpacing: 16,
                children: [
                  for (final priority in priorities)
                    PriorityCard(
                      priorityModel: priority,
                      priorityState: _priorityState,
                    ),
                ],
              ),
              // buttons

              const Gap(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
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
                  ),
                  const Gap(15),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          onEdit(context);
                        },
                        child: Text(
                          'Edit',
                          style: context.theme.headlineSmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingHorizontal(10),
              const Gap(10),
            ],
          ),
        ).paddingOnly(left: 24, right: 24),
      ],
    );
  }
}
