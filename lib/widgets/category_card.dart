import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../extensions/context_extension.dart';
import '../lists/categoriesList.dart';
import '../models/category_model.dart';
import '../store/category_state.dart';
import '../themes/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final CategoryState categoryState;

  const CategoryCard({
    super.key,
    required this.categoryModel,
    required this.categoryState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        categoryState.selectCategory(categories.indexOf(categoryModel));
      },
      child: Observer(
        builder: (context) {
          final isSelected = categories.indexOf(categoryModel) ==
              categoryState.selectedCategory;

          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: categoryModel.color,
                  border: isSelected
                      ? Border.all(color: AppColors.primary, width: 4)
                      : null,
                ),
                width: 64,
                height: 64,
                child: SvgPicture.asset(
                  categoryModel.iconPath,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const Gap(5),
              Text(
                categoryModel.title,
                style: context.theme.displaySmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
