import 'dart:ui';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFF439DEE);
  static Color get onPrimary => const Color(0xFFE8E8E9);
  static Color get secondary => const Color(0xFFFFFFFF);
  static Color get onSecondary => const Color(0xFF000000);
  static Color get tertiary => const Color(0xFF737373);
}