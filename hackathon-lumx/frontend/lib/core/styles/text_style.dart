import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get title => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 40,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);
  TextStyle get miniSmallGray => TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Satoshi',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);
  TextStyle get miniSmallWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 12.5,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);
  TextStyle get smallGray => TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Satoshi',
      fontSize: 16,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);
  TextStyle get smallWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 16,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);
  TextStyle get superSmallWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  TextStyle get mediumWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  TextStyle get bigWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  TextStyle get superBigWhite => TextStyle(
      color: AppColors.tertiary,
      fontFamily: 'Satoshi',
      fontSize: 48,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none);
  TextStyle get smallPink => TextStyle(
      color: AppColors.textHighlight,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.underline);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
