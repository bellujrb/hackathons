import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';

import '../../../../core/styles/colors.dart';

class ItemForum extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mockIMG;
  const ItemForum({super.key, required this.title, required this.subtitle, required this.mockIMG});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: context.mediaWidth * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white70
      ),
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
                  style: GoogleFonts.inter(),
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
            child: SizedBox(
              height: 21.57,
              width: 96.59,
              child: Image.asset(mockIMG),
            ),
          )
        ],
      ),
    );
  }
}
