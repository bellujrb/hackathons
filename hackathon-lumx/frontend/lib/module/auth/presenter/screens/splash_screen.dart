// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Modular.to.navigate("welcome");
    });
  }

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;

    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        height: context.mediaHeight * 1.0,
        width: context.mediaWidth * 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 56,
              width: 116.29,
              child: Image(image: AssetImage("assets/img/logo.png")),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "The one and only fidelity\n program you will need!",
              style: styleModifier.smallGray,
            ),
          ],
        ),
      ),
    );
  }
}
