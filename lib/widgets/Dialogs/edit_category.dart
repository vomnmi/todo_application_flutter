import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/widget_extension.dart';
import '../../lists/categoriesList.dart';
import '../../store/category_state.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';
import '../category_card.dart';

class EditCategory extends StatefulWidget {
  final int index;

  const EditCategory({
    super.key,
    required this.index,
  });

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final HomeState _homeState = HomeState();
  final CategoryState _categoryState = CategoryState();

  @override
  void initState() {
    super.initState();
    _categoryState.selectedCategory =
        categories.indexOf(_homeState.tasks[widget.index].category!);
  }

  void onEdit(BuildContext context) {
    final editedTask = _homeState.tasks[widget.index].copyWith(
      category: categories[_categoryState.selectedCategory],
    );
    _homeState.editTask(editedTask);
    Navigator.pop(context);
  }

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
                  crossAxisSpacing: 29,
                  children: [
                    for (final category in categories)
                      CategoryCard(
                        categoryModel: category,
                        categoryState: _categoryState,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
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
              const Gap(5),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onEdit(context);
                  },
                  child: Text(
                    'Edit',
                    style: GoogleFonts.lato(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 8),
        ],
      ),
    ).paddingSymmetric(vertical: 70);
  }
}
