import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';

AppBar buildAppBar(BuildContext context) {
  final styleModifier = context.appTextStyles;
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: context.mediaWidth * 1.0,
    toolbarHeight: context.mediaHeight * 0.1,
    leading: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Sophia",
            style: GoogleFonts.inter(textStyle: styleModifier.mediumRed),
          ),
          SizedBox(
            height: 46.5,
            width: 46.5,
            child: Image.asset("assets/photogirl.png"),
          )
        ],
      ),
    ),
  );
}
