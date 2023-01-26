import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColors.primary,
    splashColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgorundColor,

    // font
    fontFamily: AppStrings.fontFamily,

    // indicator
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),

    // text theme
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: AppColors.blackColor54,
    )),

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeights.fw500,
          fontFamily: AppStrings.fontFamily),
      elevation: AppSize.s0,
    ),

    // input theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,
      iconColor: AppColors.blackColor45,
      hintStyle: TextStyle(
        fontSize: FontSize.s14,
        color: AppColors.lightGrey,
      ),
      errorStyle: const TextStyle(color: AppColors.primary),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide.none,
      ),
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: const StadiumBorder(),
      ),
    ),
  );
}
