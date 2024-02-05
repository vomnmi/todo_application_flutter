import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/context_extension.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

final base = ThemeData.dark();

final darkTheme = base.copyWith(
  primaryColor: AppColors.primaryLight,
  expansionTileTheme: base.expansionTileTheme.copyWith(
    collapsedIconColor: base.primary,
    collapsedTextColor: base.primary,
    clipBehavior: Clip.none,
    shape: Border(
      bottom: BorderSide(
        color: base.primary,
      ),
    ),
    collapsedShape: Border(
      bottom: BorderSide(
        color: base.primary,
      ),
    ),
    tilePadding: const EdgeInsets.symmetric(horizontal: 20),
  ),
  colorScheme: base.colorScheme.copyWith(
    primary: AppColors.primaryLight,
    primaryContainer: AppColors.primaryContainerLight,
    secondary: AppColors.secondaryLight,
    background: AppColors.backgroundLight,
    surface: AppColors.surfaceLight,
    error: AppColors.error,
    onPrimary: AppColors.onPrimaryLight,
    onSecondary: AppColors.onSecondaryLight,
    onBackground: AppColors.onBackgroundLight,
    onSurface: AppColors.onSurfaceLight,
    onError: AppColors.onErrorLight,
  ),
  cardTheme: CardTheme(
    color: base.background,
    shadowColor: AppColors.elevationColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    clipBehavior: Clip.none,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelStyle: base.primaryTextTheme.labelLarge!.copyWith(
      color: AppColors.primaryLight,
    ),
    labelStyle: const TextStyle(
      color: AppColors.primaryLight,
      fontFamily: FontFamily.regular,
      fontSize: 16,
      height: 1,
    ),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: AppColors.primaryLight,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.primaryLight,
    unselectedLabelColor: AppColors.primaryLight,
    labelPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  // shadowColor: Colors.grey[300],
  scaffoldBackgroundColor: AppColors.backgroundLight,
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.backgroundLight,
  ),
  dividerColor: AppColors.hintText,
  dividerTheme: base.dividerTheme.copyWith(
    space: 1,
    thickness: 1,
    indent: 0,
    endIndent: 0,
    color: AppColors.disabledButtonTextColor,
  ),
  primaryIconTheme:
      base.primaryIconTheme.copyWith(color: AppColors.primaryLight),
  iconTheme: base.iconTheme.copyWith(color: AppColors.primaryLight),
  appBarTheme: base.appBarTheme.copyWith(
    color: AppColors.surfaceLight,
    centerTitle: false,
    titleSpacing: 20,
    iconTheme: const IconThemeData(
      color: AppColors.primaryLight,
      size: 24,
    ),
    elevation: 8,
    shadowColor: AppColors.primaryLight.withOpacity(0.15),
    titleTextStyle: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.regular,
      color: AppColors.onSecondaryLight,
      fontWeight: FontWeight.w400,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: base.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: base.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: base.appBarTheme.backgroundColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    toolbarTextStyle: base.textTheme
        .copyWith(
          bodyLarge: base.textTheme.bodyLarge!.copyWith(
            fontFamily: FontFamily.regular,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: base.textTheme.titleLarge!.copyWith(
            fontFamily: FontFamily.regular,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: base.textTheme.displaySmall!.copyWith(
            fontFamily: FontFamily.bold,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: base.textTheme.headlineMedium!.copyWith(
            fontFamily: FontFamily.bold,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w500,
          ),
        )
        .bodyMedium,
  ),
  bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
    backgroundColor: AppColors.backgroundLight,
    selectedItemColor: AppColors.primaryLight,
    unselectedItemColor: AppColors.onBackgroundLight,
    selectedLabelStyle: base.textTheme.bodyMedium,
    unselectedLabelStyle: base.textTheme.bodyLarge,
    elevation: 4,
    type: BottomNavigationBarType.shifting,
  ),
  chipTheme: base.chipTheme.copyWith(
    backgroundColor: Colors.transparent,
    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelStyle: const TextStyle(
      color: AppColors.primaryLight,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.regular,
    ),
    selectedColor: AppColors.primaryLight,
    secondaryLabelStyle: const TextStyle(
      color: AppColors.primaryLight,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.regular,
    ),
    secondarySelectedColor: Colors.transparent,
  ),
  sliderTheme: base.sliderTheme.copyWith(
    activeTrackColor: AppColors.primaryLight,
    inactiveTrackColor: AppColors.primaryLight,
    overlayColor: Colors.transparent,
    thumbColor: AppColors.primaryLight,
    thumbShape: SliderComponentShape.noOverlay,
    valueIndicatorColor: AppColors.primaryLight,
  ),
  textSelectionTheme: base.textSelectionTheme.copyWith(
    cursorColor: AppColors.primaryLight,
    selectionHandleColor: AppColors.primaryLight,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: AppColors.primaryLight,
  ),
  brightness: Brightness.light,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    prefixStyle: base.textTheme.bodyLarge!.copyWith(
      color: AppColors.onSecondaryLight,
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColors.disabledButtonColor,
      ),
    ),
    errorStyle: const TextStyle(
      color: AppColors.error,
      fontFamily: FontFamily.regular,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    hintStyle: base.primaryTextTheme.bodyLarge!.copyWith(
      color: AppColors.hintText,
      fontFamily: FontFamily.regular,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.2,
    ),
    fillColor: AppColors.surfaceLight,
    contentPadding: const EdgeInsets.only(
      left: 18,
      top: 12,
      bottom: 12,
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColors.inputBorderLight,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColors.error,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColors.inputBorderLight,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.inputBorderLight,
      ),
    ),
    filled: true,
    labelStyle: const TextStyle(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.regular,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.2,
    ),
  ),

  buttonTheme: base.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    buttonColor: AppColors.primaryLight,
  ),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderRadius: BorderRadius.circular(4),
    borderColor: AppColors.primaryLight,
    color: AppColors.primaryLight,
    selectedBorderColor: AppColors.primaryLight,
    selectedColor: AppColors.onPrimaryLight,
    fillColor: AppColors.primaryLight,
    constraints: const BoxConstraints(minHeight: 38, minWidth: 64),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
      textStyle: MaterialStateProperty.all(base.textTheme.bodyLarge),
      shape: MaterialStateProperty.resolveWith(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: states.contains(MaterialState.disabled)
                  ? AppColors.disabledButtonColor
                  : AppColors.primaryLight,
            ),
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonTextColor
              : AppColors.primaryLight;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonColor
              : Colors.transparent;
        },
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
      textStyle: MaterialStateProperty.all(base.textTheme.bodyLarge),
      shape: MaterialStateProperty.resolveWith(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: states.contains(MaterialState.disabled)
                  ? AppColors.disabledButtonColor
                  : AppColors.primaryLight,
            ),
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonTextColor
              : AppColors.primaryLight;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonColor
              : Colors.transparent;
        },
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    decoration: BoxDecoration(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      overlayColor: MaterialStateProperty.all(
        AppColors.lightGray.withOpacity(.3),
      ),
      shadowColor:
          MaterialStateProperty.all(AppColors.buttonShadow.withOpacity(0.15)),
      elevation: MaterialStateProperty.all(5),
      textStyle: MaterialStateProperty.all(base.textTheme.labelLarge),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonTextColor
              : AppColors.onPrimaryLight;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonColor
              : Colors.transparent;
        },
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      // shadowColor: MaterialStateProperty.all(AppColors.primary),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
      overlayColor: MaterialStateProperty.all(AppColors.yellow),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(base.textTheme.labelLarge),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonTextColor
              : AppColors.yellow;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.disabledButtonColor
              : Colors.transparent;
        },
      ),
    ),
  ),
  textTheme: base.textTheme.copyWith(
    displayLarge: base.textTheme.displayLarge!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.bold,
      fontWeight: FontWeight.w700,
      fontSize: 26,
      height: 1.57,
    ),
    displayMedium: base.textTheme.displayMedium!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.medium,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      height: 1.57,
    ),
    displaySmall: base.textTheme.displaySmall!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.regular,
      fontWeight: FontWeight.w500,
      fontSize: 32,
      height: 1.57,
    ),
    headlineMedium: base.textTheme.headlineMedium!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.bold,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 1.57,
    ),
    headlineSmall: base.textTheme.headlineSmall!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.bold,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.57,
    ),
    bodyLarge: base.textTheme.bodyLarge!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.medium,
      fontSize: 14,
      height: 1.57,
    ),
    bodyMedium: base.textTheme.bodyMedium!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.regular,
      fontSize: 12,
      height: 1.57,
    ),
    titleMedium: base.textTheme.titleMedium!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.medium,
      fontSize: 14,
      height: 1.57,
    ),
    labelLarge: base.textTheme.labelLarge!.copyWith(
      color: AppColors.onSecondaryLight,
      fontFamily: FontFamily.regular,
      fontSize: 16,
      height: 1.57,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryLight;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryLight;
      }
      return null;
    }),
  ),
  switchTheme: base.switchTheme
      .copyWith(
    trackColor: const MaterialStatePropertyAll(AppColors.primaryLight),
    thumbColor: const MaterialStatePropertyAll(AppColors.disabledButtonColor),
  )
      .copyWith(
    thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryLight;
      }
      return null;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryLight;
      }
      return null;
    }),
  ),
);
