import 'package:flutter/material.dart';
import '../styles/colors.dart';

ThemeData get lightTheme => ThemeData(
  scaffoldBackgroundColor: AppColors.secondary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
);

ThemeData get darkTheme => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: null,
    )
);