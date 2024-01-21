import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

class CourseItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String porcent;
  const CourseItem({super.key, required this.title, required this.subtitle, required this.porcent});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
      alignment: Alignment.center,
      height: 120,
      width: context.mediaWidth * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.mediaWidth * 0.7,
                  child: Text(
                    title,
                    style:
                        GoogleFonts.inter(textStyle: styleModifier.mediumBlack),
                  ),
                ),
                Text(
                  porcent,
                  style: GoogleFonts.inter(textStyle: styleModifier.mediumRed),
                )
              ],
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(),
            )
          ],
        ),
      ),
    );
  }
}
