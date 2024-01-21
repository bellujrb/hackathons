import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

import '../../../../core/styles/colors.dart';

class SelectorMock extends StatelessWidget {
  const SelectorMock({super.key});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 140,
            decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              "New Conversation",
              style: GoogleFonts.inter(textStyle: styleModifier.smallWhite),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              "My Answers",
              style: GoogleFonts.inter(textStyle: styleModifier.smallWhite),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 60,
            decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              "Saved",
              style: GoogleFonts.inter(textStyle: styleModifier.smallWhite),
            ),
          ),
        ],
      ),
    );
  }
}
