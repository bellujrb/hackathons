// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackathon_austria/core/extensions/build_context_utils.dart';

class ContainerItemPositionLong extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? colorIcon;
  final TextStyle? styleText;
  final IconData? icon;
  const ContainerItemPositionLong({
    Key? key,
    required this.title,
    required this.color, required this.styleText, this.icon, this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediaHeight * 0.09,
      width: context.mediaWidth * 0.8,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.mediaWidth * 0.6,
              child: Text(
                title,
                style: GoogleFonts.inter(textStyle: styleText),
              ),
            ),
            Icon(
              icon,
              color: colorIcon,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
