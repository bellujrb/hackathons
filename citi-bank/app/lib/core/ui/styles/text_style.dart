import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get textBoldBlackBig => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.onSecondary
  );
  TextStyle get titleButton => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary
  );
  TextStyle get textSubtitleGray => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.onSecondary
  );
  TextStyle get textAccountOrange => TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: AppColors.primary
  );
  TextStyle get textTitleBigBlackBold => TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: AppColors.onSecondary
  );

  // Dashboard
  TextStyle get textNumberDashboardBold=> TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.onSecondary
  );
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}