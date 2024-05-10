import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/text_style.dart';

class ExploreWidget extends StatelessWidget {
  final String img;
  final String name;
  final String token;
  const ExploreWidget({super.key, required this.img, required this.name, required this.token});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: context.mediaWidth * 1.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: Image.asset("assets/img/$img"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: context.appTextStyles.smallWhite,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Text(
                        "\$",
                        style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                      ),
                      Text(
                        token,
                        style: const TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
