import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../lists/priority_list.dart';
import '../models/priority_model.dart';
import '../store/priority_state.dart';
import '../themes/app_colors.dart';

class PriorityCard extends StatelessWidget {
  final PriorityModel priorityModel;
  final PriorityState priorityState;
  const PriorityCard({
    super.key,
    required this.priorityModel,
    required this.priorityState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        priorityState.selectCategory(priorities.indexOf(priorityModel));
      },
      child: Observer(
        builder: (context) {
          final isSelectedPriority = priorities.indexOf(priorityModel) ==
              priorityState.selectedPriorityIndex;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelectedPriority ? AppColors.purple : Colors.black26,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  priorityModel.iconPath,
                ),
                const Gap(5),
                Text(
                  priorityModel.priorityNumber.toString(),
                  style: context.theme.displaySmall.copyWith(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
