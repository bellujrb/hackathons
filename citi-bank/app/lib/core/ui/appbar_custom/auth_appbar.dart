import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

AppBar authAppBar(BuildContext context, String title) {
  final textModifier = context.appTextStyles;
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.secondary,
    leadingWidth: context.mediaWidth,
    toolbarHeight: context.mediaHeight * 0.16,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/logo.png'),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: textModifier.textBoldBlackBig
            ),
          )
        ],
      ),
    );
}
