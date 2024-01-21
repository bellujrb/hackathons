import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

class GraphicWidget extends StatelessWidget {
  const GraphicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
      width: context.mediaWidth * 0.9,
      height: 213,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 191.2,
            width: 191.2,
            child: Image.asset('assets/graphic.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4",
                style:
                    GoogleFonts.inter(textStyle: styleModifier.smallPlusGreen),
              ),
              Text(
                "Applied Positions",
                style: GoogleFonts.inter(textStyle: styleModifier.smallGreen),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "1490",
                style: GoogleFonts.inter(textStyle: styleModifier.smallPlusRed),
              ),
              Text(
                "Open Positions",
                style: GoogleFonts.inter(textStyle: styleModifier.smallRed),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "900",
                style:
                    GoogleFonts.inter(textStyle: styleModifier.smallPlusPurple),
              ),
              Text(
                "New Positions",
                style: GoogleFonts.inter(textStyle: styleModifier.smallPurple),
              ),
            ],
          )
        ],
      ),
    );
  }
}
