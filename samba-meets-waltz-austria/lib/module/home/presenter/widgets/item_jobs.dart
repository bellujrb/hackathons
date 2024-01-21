import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

import '../../../../core/styles/colors.dart';

class ItemJobs extends StatelessWidget {
  final String title;
  final String subtitle;
  const ItemJobs(
      {super.key,
      required this.title,
      required this.subtitle,
      });

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return InkWell(
      onTap: () => Modular.to.navigate("diagnostic"),
      child: Container(
        height: 200,
        width: context.mediaWidth * 0.9,
        decoration: const BoxDecoration(color: Colors.white70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: styleModifier.smallPlusBlack
                    ),
                  ),
                  SizedBox(
                      width: 17,
                      height: 19,
                      child: Image.asset("assets/iconcommunity1.png"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("􀼼"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Vienna",
                    style: GoogleFonts.inter(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.mediaWidth * 0.6,
                    child: Text(
                      subtitle,
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    size: 24,
                    color: AppColors.primaryBlack,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "80% Match with Your Profile",
                  style: GoogleFonts.inter(
                    textStyle: styleModifier.smallBlue
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
