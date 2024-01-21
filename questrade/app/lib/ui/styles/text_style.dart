import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  //Black
  TextStyle get textSmallCommonBlack => TextStyle(
      fontSize: 11,
      color: AppColors.onSecondary,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  TextStyle get textMediumBoldBlack => TextStyle(
      fontSize: 16,
      color: AppColors.onSecondary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  TextStyle get textBigBoldBlack => TextStyle(
      fontSize: 30,
      color: AppColors.onSecondary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  //White
  TextStyle get textMediumCommonWhite => TextStyle(
      fontSize: 13,
      color: AppColors.onPrimary,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none);
  TextStyle get textMediumBoldWhite => TextStyle(
      fontSize: 13,
      color: AppColors.onPrimary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  //Gray
  TextStyle get textMediumCommonGray => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.tertiary,
      decoration: TextDecoration.none);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
