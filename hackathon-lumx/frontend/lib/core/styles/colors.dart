import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFF0F172A);
  static Color get onPrimary => const Color(0xFF6B04FD);
  static Color get secondary => const Color(0xFF94A3B8);
  static Color get onSecondary => const Color(0xFF334155);
  static Color get tertiary => const Color(0xFFF1F5F9);
  static Color get onTertiary => const Color(0xFFCBD5E1);

  static Color get backgroundInput => const Color(0xFF020617);
  static Color get textHighlight => const Color(0xFFFF649A);
  static Color get surfacePrimary => const Color(0xFF1E293B);
}
