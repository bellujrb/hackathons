import 'dart:ui';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFF2C502E);
  static Color get onPrimary => const Color(0xFFFFFFFF);
  static Color get secondary => const Color(0xFFEFF3FD);
  static Color get onSecondary => const Color(0xE5333030);
  static Color get tertiary => const Color(0xFF707070);
  static Color get onTertiary => const Color(0xFF3DA542);
}