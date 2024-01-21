import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

import '../../../../core/styles/colors.dart';

class ItemCarrousel extends StatelessWidget {
  final String title;
  final String img;
  const ItemCarrousel({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(img),
          SizedBox(
            width: context.mediaWidth * 0.8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: styleModifier.mediumBlack,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Modular.to.navigate('home'),
            child: Container(
              alignment: Alignment.center,
              height: 36,
              width: context.mediaWidth * 0.7,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                "Enter",
                style:
                    GoogleFonts.inter(textStyle: styleModifier.temporaryText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleItemCarrousel extends StatelessWidget {
  final String title;
  final String img;
  const SimpleItemCarrousel({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(img),
          SizedBox(
            width: context.mediaWidth * 0.8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: styleModifier.mediumBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}