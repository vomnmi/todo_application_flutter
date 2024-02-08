import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extensions/widget_extension.dart';
import '../lists/categoriesList.dart';
import '../models/category_model.dart';
import '../store/category_state.dart';
import '../themes/app_colors.dart';
import 'category_card.dart';

class CategoryDialog extends StatelessWidget {
  final CategoryState _categoryState = CategoryState();
  final void Function(CategoryModel) onAdd;
  CategoryDialog({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.bottomNavBar,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(10),
          Text(
            'Choose a Category',
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
          Column(
            children: [
              SizedBox(
                width: 330,
                height: 430,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 30,
                  children: [
                    for (final category in categories)
                      CategoryCard(
                        categoryModel: category,
                        categoryState: _categoryState,
                      ),
                  ],
                ),
              ).paddingOnly(top: 15, bottom: 11, left: 19, right: 19),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_categoryState.selectedCategory != -1) {
                  onAdd(categories[_categoryState.selectedCategory]);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add Category',
                style: GoogleFonts.lato(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ).paddingOnly(left: 29, right: 29, bottom: 19, top: 30),
        ],
      ),
    ).paddingSymmetric(vertical: 124);
  }
}
