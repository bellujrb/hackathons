import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class CardFidelityOther extends StatelessWidget {
  const CardFidelityOther({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = const LinearGradient(
      colors: [
        Color(0xFF843DFF),
        Color(0xFFFF649A),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: context.mediaWidth * 0.8,
      decoration: BoxDecoration(
        color: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Burgers Shop",
                  style: context.appTextStyles.smallWhite,
                ),
                Text(
                  "Fidelity card",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = textGradient,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset("assets/img/logo-burger.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: context.appTextStyles.bigWhite,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Row(
                      children: [
                        Text(
                          "\$",
                          style:
                              TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                        ),
                        Text(
                          "BURGER",
                          style:
                              TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.navigate("exchange");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 64,
                    width: context.mediaWidth * 0.32,
                    decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        borderRadius: BorderRadius.circular(80)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Exchange for other coin",
                        style: context.appTextStyles.miniSmallWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate("marketplace");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 64,
                    width: context.mediaWidth * 0.32,
                    decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        borderRadius: BorderRadius.circular(80)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Exchange for benefits",
                        style: context.appTextStyles.miniSmallWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
