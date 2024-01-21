import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  const InfoCard({Key? key, required this.title, required this.subtitle, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: context.mediaWidth * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primary.withOpacity(0.8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 5
            ),
            width: context.mediaWidth * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      textStyle:
                      context.styleModifier.textMediumBoldWhite),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                      textStyle: context
                          .styleModifier.textMediumCommonWhite),
                )
              ],
            ),
          ),
          SizedBox(
            width: 119,
            height: 119,
            child: Image.asset(img),
          )
        ],
      ),
    );
  }
}
