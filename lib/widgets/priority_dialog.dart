import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extensions/context_extension.dart';
import '../extensions/widget_extension.dart';
import '../lists/priority_list.dart';
import '../models/priority_model.dart';
import '../store/priority_state.dart';
import '../themes/app_colors.dart';
import 'priority_card.dart';

class PriorityDialog extends StatelessWidget {
  final PriorityState _priorityState = PriorityState();
  final void Function(PriorityModel) onSelectingPriority;
  PriorityDialog({super.key, required this.onSelectingPriority});

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
                  const Gap(15),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_priorityState.selectedPriorityIndex != -1) {
                            onSelectingPriority(
                              priorities[_priorityState.selectedPriorityIndex],
                            );
                            Navigator.pop(context);
                          }
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
