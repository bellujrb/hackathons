import 'package:flutter/material.dart';
import 'package:hackathon_austria/core/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get specialText => const TextStyle(
        color: Color(0xFFA05D1F),
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.41,
      );

  TextStyle get smallBlack => TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 11.15,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.28,
      );

  TextStyle get smallPlusBlack => TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      );

  TextStyle get mediumBlack => TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 23.10,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.28,
      );

  TextStyle get temporaryText => const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get smallRed => TextStyle(
      color: AppColors.primaryRed, fontSize: 11.0, fontWeight: FontWeight.w400);

  TextStyle get smallPlusRed => TextStyle(
      color: AppColors.primaryRed, fontSize: 16.0, fontWeight: FontWeight.w400);

  TextStyle get smallGreen => TextStyle(
      color: AppColors.primaryGreen,
      fontSize: 12.0,
      fontWeight: FontWeight.w400);

  TextStyle get smallOrange => TextStyle(
      color: AppColors.primaryOrange,
      fontSize: 12.0,
      fontWeight: FontWeight.w400);

  TextStyle get smallPlusGreen => TextStyle(
      color: AppColors.primaryGreen,
      fontSize: 16.0,
      fontWeight: FontWeight.w400);

  TextStyle get smallPurple => TextStyle(
      color: AppColors.primaryPurple,
      fontSize: 11.0,
      fontWeight: FontWeight.w400);

  TextStyle get smallPlusPurple => TextStyle(
      color: AppColors.primaryPurple,
      fontSize: 16.0,
      fontWeight: FontWeight.w400);

  TextStyle get mediumRed => TextStyle(
      color: AppColors.primaryRed, fontSize: 24.0, fontWeight: FontWeight.w700);

  TextStyle get smallWhite => const TextStyle(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600);

  TextStyle get smallBlue => TextStyle(
      color: AppColors.primaryBlue, fontSize: 13, fontWeight: FontWeight.w600);

  TextStyle get mediumBlue => TextStyle(
      color: AppColors.secondaryBlue,
      fontSize: 18,
      fontWeight: FontWeight.w600);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
