import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class ImgUser extends StatelessWidget {
  const ImgUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.onPrimary,
        child: Text(
          "B",
          style: GoogleFonts.poppins(
            textStyle: context.styleModifier.textMediumBoldBlack
          ),
        ),
      ),
    );
  }
}