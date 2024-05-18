import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFFFF649A);
  static Color get onPrimary => const Color(0xFF1F2937);
  static Color get secondary => const Color(0xFF4B5563);
  static Color get onSecondary => const Color(0xFFE9E9E9);
  static Color get tertiary => const Color(0xFFF1F5F9);
}
