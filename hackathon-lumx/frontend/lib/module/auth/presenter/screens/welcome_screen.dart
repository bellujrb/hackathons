import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/auth/presenter/widgets/button_sample.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        height: context.mediaHeight * 1.0,
        width: context.mediaWidth * 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 372,
              width: 298,
              child: Image.asset("assets/img/illustration.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to the best \nreward program you’ve \never been part!",
              style: context.appTextStyles.mediumWhite,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonSample(
              title: "Let’s get started",
              callback: () {
                Modular.to.navigate("login");
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
