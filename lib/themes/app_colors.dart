import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // My App colors
  static const background = Color(0xff121212);
  static const primary = Color(0xff8875FF);
  static const purple = Color(0xff8687E7);
  static const disabledButton = Color(0x508875FF);
  static const disabledTextButton = Color(0x30FFFFFF);
  static const textGrey = Color(0x44FFFFFF);
  static const grey = Color(0xffAFAFAF);
  static const textFieldColor = Color(0xff979797);
  static const hintTextColor = Color(0xff535353);
  static const textFieldGrey = Color(0xff1d1d1d);
  static const bottomNavBar = Color(0xff363636);
  static const blackBackground = Color(0xff121212);
  static const editTaskButton = Color(0xff1d1d1d);
  static const deleteTaskButton = Color.fromARGB(255, 255, 73, 73);

  // Category Colors
  static const groceryColor = Color(0xffCCFF80);
  static const workColor = Color(0xffFF9680);
  static const sportColor = Color(0xff80FFFF);
  static const designColor = Color(0xff80FFD9);
  static const universityColor = Color(0xff809CFF);
  static const socialColor = Color(0xffFF80EB);
  static const musicColor = Color(0xffFC80FF);
  static const healthColor = Color(0xff80FFA3);
  static const movieColor = Color(0xff80D1FF);
  static const homeColor = Color(0xffFFCC80);

  // Priority Color
  static const priority = Color(0xFF272727);

  // light mode colors
  static const primaryLight = Color(0xffDB2828);
  static const primaryContainerLight = Color(0xffDB2828);
  static const secondaryLight = Color(0xffFFBC42);
  static const backgroundLight = Color(0xffFCFCFC);
  static const surfaceLight = Color(0xffFFFFFF);
  static const onPrimaryLight = Color(0xffFFFFFF);
  static const onSecondaryLight = Color(0xff292929);
  static const onBackgroundLight = Color(0xff292929);
  static const onSurfaceLight = Color(0xff393939);
  static const onErrorLight = Color(0xffFFFFFF);

  // dark mode colors
  static const primaryDark = Color(0xffDB2828);
  static const primaryContainerDark = Color(0xffDB2828);
  static const secondaryDark = Color(0xffFFBC42);
  static const backgroundDark = Color(0xffFEFFFF);
  static const surfaceDark = Color(0xffFFFFFF);
  static const onPrimaryDark = Color(0xffFFFFFF);
  static const onSecondaryDark = Color(0xff292929);
  static const onBackgroundDark = Color(0xff292929);
  static const onSurfaceDark = Color(0xff393939);
  static const onErrorDark = Color(0xffFFFFFF);

  // general colors
  static const error = Color(0xffFE4A49);
  static const white = Color(0xFFFFFFFF);
  static Color elevationColor = const Color(0xffDB2828).withOpacity(0.15);
  static const blue = Color(0xffDB2828);
  static const hintText = Color(0xffB5B8B8);
  static const lightGray = Color(0xffB5B8B8);
  static const otpBackground = Color(0xffF4F4F4);
  static const inputBackground = Color(0xffF2F2F2);
  static const inputBorderLight = Color(0xff747777);
  static const inputBorderDark = Color(0xffB5B8B8);
  static const disabledButtonColor = Color(0xffA1A1A1);
  static const disabledButtonTextColor = Color(0xff747777);
  static const yellow = Color(0xffFFAC30);
  static const tabSelectedColor = Color(0xffFEFFFF);
  static const buttonShadow = Color(0xff000000);
  static const success = Color(0xff6FC456);
  static const activated = Color(0xff6FC356);
  static const shimmerBaseColor = Color(0xffE1E1E1);
  static const shimmerHighlightColor = Color(0xffffffff);
  static const sliderColor = Color(0xff09966B);
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFDB2828),
      Color(0xFFFD6969),
    ],
    stops: [0.1425, 0.8523],
  );
  static const blackGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF292929),
      Color(0xFF454545),
    ],
    stops: [0.1425, 0.8523],
  );
  static const whiteGradient = LinearGradient(
    colors: [
      Colors.white,
      Colors.white,
      Color.fromRGBO(255, 255, 255, 0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5104, 1.0],
  );

  static const midnightExpress = MaterialColor(
    0xFF262931,
    <int, Color>{
      50: Color(0xFFF4F4F5),
      100: Color(0xFFE9EAEA),
      200: Color(0xFFD4D4D6),
      300: Color(0xFFA8AAAD),
      400: Color(0xFF7D7F83),
      500: Color(0xFF51545A),
      600: Color(0xFF262931),
      700: Color(0xFF1D1F25),
      800: Color(0xFF111216),
      900: Color(0xFF0D0E11),
    },
  );

  // static Color get modalBackgroundColor => brightnessColor(
  //       lightColor: AppColors.midnightExpress,
  //       darkColor: AppColors.white,
  //     );
}
