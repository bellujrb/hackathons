// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFF009265);
  static Color get secondary => Colors.white;
}
