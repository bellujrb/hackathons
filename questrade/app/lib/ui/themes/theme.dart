import 'package:flutter/material.dart';
import '../styles/colors.dart';

ThemeData get lightTheme => ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.onPrimary,
  ),
);

ThemeData get darkTheme => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: null,
    )
);