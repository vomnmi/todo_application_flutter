import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../models/category_model.dart';

class CategoryOnTaskCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final Color? backgroundColor;
  final EdgeInsets padding;

  const CategoryOnTaskCard({
    super.key,
    required this.categoryModel,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 7.5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor ?? categoryModel.color,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            categoryModel.iconPath,
            fit: BoxFit.cover,
            height: 24,
          ),
          const Gap(5),
          Text(
            categoryModel.title,
            style: context.theme.displaySmall,
          ),
        ],
      ),
    );
  }
}
