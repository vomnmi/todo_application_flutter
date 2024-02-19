import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';

class DeleteTaskDialog extends StatelessWidget {
  final void Function() onConfirm;
  const DeleteTaskDialog({
    super.key,
    required this.onConfirm,
  });
  HomeState get state => HomeState();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DecoratedBox(
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
              'Delete Task',
              style: GoogleFonts.lato(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            ),
            const Gap(10),
            const Divider(),
            const Gap(16),
            Text(
              'Are You sure you want to delete this task?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
            const Gap(36),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
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
                const Gap(10),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: AppColors.purple,
                        ),
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(
                          'Delete',
                          style: context.theme.headlineSmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingHorizontal(),
            const Gap(4),
          ],
        ),
      ),
    );
  }
}
