import 'package:flutter/material.dart';
import 'package:hackathon_arteris/core/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get whiteSmall => TextStyle(
        color: AppColors.secondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
      );
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
