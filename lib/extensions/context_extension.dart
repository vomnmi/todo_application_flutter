import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get media => MediaQuery.of(this);

  double get height => media.size.height;

  double get bodyHeight => height - 100;

  double get width => media.size.width;

  double get topPadding => media.padding.top;

  double get bottomPadding => media.padding.bottom;

  bool get isDarkMode => media.platformBrightness == Brightness.dark;
}

extension ThemeDataHelper on ThemeData {
  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayLargeGray =>
      textTheme.displayLarge!.copyWith(color: AppColors.disabledButtonColor);

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displayMediumGray =>
      textTheme.displayMedium!.copyWith(color: AppColors.disabledButtonColor);

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelLargeGray =>
      textTheme.labelLarge!.copyWith(color: AppColors.disabledButtonColor);

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get subtitle3 => textTheme.titleSmall!
      .copyWith(
        fontSize: 14,
        letterSpacing: -0.01,
      )
      .medium;

  TextStyle get button1 => textTheme.labelLarge!;

  TextStyle get button2 => textTheme.labelLarge!.copyWith(
        fontSize: 20,
        height: 1.25,
      );

  TextStyle get button3 => textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1,
      );

  TextStyle get button4 => textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
      );

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyLargeGray =>
      textTheme.bodyLarge!.copyWith(color: AppColors.disabledButtonColor);

  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodyMediumGray =>
      textTheme.bodyMedium!.copyWith(color: AppColors.disabledButtonColor);

  TextStyle get bodyMediumBold => textTheme.bodyMedium!.bold;

  TextStyle get body17 => textTheme.bodyMedium!.size(17);

  TextStyle get caption1 => textTheme.bodySmall!;

  TextStyle get caption2 => textTheme.bodySmall!.bold;

  TextStyle get overline => textTheme.labelSmall!;

  ButtonStyle get elevatedButtonStyle => elevatedButtonTheme.style!;

  ButtonStyle get textButtonStyle => textButtonTheme.style!;

  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get surface => colorScheme.surface;
  Color get primaryVariant => colorScheme.primaryContainer;
  Color get secondaryVariant => colorScheme.secondaryContainer;
  Color get background => colorScheme.background;
  Color get error => colorScheme.error;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onBackground => colorScheme.onBackground;
  Color get onError => colorScheme.onError;
  Brightness get brightness => colorScheme.brightness;
}

extension ElevatedButtonHelper on ButtonStyle {
  ButtonStyle buttonColor(Color color) => copyWith(
        shadowColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(foregroundColor as Color?),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? color.withOpacity(0.5)
                : color;
          },
        ),
      );

  ButtonStyle elevationSize(double elevation) {
    return copyWith(
      elevation: MaterialStateProperty.all(
        elevation,
      ),
    );
  }

  ButtonStyle paddingAll(double padding) {
    return copyWith(
      padding: MaterialStateProperty.all(
        EdgeInsets.all(padding),
      ),
    );
  }

  ButtonStyle paddingVertical(double padding) {
    return copyWith(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: padding),
      ),
    );
  }

  ButtonStyle get removePaddings => copyWith(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
      );

  ButtonStyle textColor(
    Color color,
  ) {
    return copyWith(
      foregroundColor: MaterialStateProperty.all(
        color,
      ),
    );
  }
}

// usage example: context.h3.regular.white
extension TextStyleHelpers on TextStyle {
  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get yellow => copyWith(color: AppColors.yellow);

  TextStyle get lightGray => copyWith(color: AppColors.lightGray);

  TextStyle get error => copyWith(color: AppColors.error);

  TextStyle size([double? fontSize]) => copyWith(fontSize: fontSize);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}

extension GlobalKeyEx on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();

    return translation != null && renderObject?.paintBounds != null
        ? renderObject!.paintBounds.shift(Offset(translation.x, translation.y))
        : null;
  }
}
