import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class CardFidelity extends StatelessWidget {
   final VoidCallback callback;
  const CardFidelity({super.key, required this.callback});

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

    return InkWell(
      onTap: callback,
      child: Container(
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
              Text(
                "Fidelity card",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = textGradient,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: Image.asset("assets/img/logo-burger.png"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Burgers Shop",
                        style: context.appTextStyles.smallWhite,
                      ),
                      const SizedBox(
                        height: 5,
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
                height: 10,
              ),
              Text(
                "Current Balance",
                style: context.appTextStyles.smallWhite,
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
                        style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                      ),
                      Text(
                        "BURGER",
                        style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
