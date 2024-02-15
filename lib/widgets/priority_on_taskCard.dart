import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../models/priority_model.dart';
import '../themes/app_colors.dart';

class PriorityOnTaskCard extends StatelessWidget {
  final PriorityModel priorityModel;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final bool showBorder;

  const PriorityOnTaskCard({
    super.key,
    required this.priorityModel,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 6.5),
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border:
            showBorder ? Border.all(color: AppColors.purple, width: 2) : null,
        color: backgroundColor ?? Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            priorityModel.iconPath,
            fit: BoxFit.cover,
            height: 24,
          ),
          const Gap(5),
          Text(
            priorityModel.priorityNumber.toString(),
            style: context.theme.displaySmall,
          ),
        ],
      ),
    );
  }
}
