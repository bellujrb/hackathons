import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class IconNavigation extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? function;
  const IconNavigation({Key? key, required this.icon, required this.title, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            width: 64,
            height: 64,
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Icon(
              icon,
              size: 24,
              color: AppColors.onTertiary,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title, style: GoogleFonts.poppins(
          textStyle: context.styleModifier.textSmallCommonBlack
        ),)
      ],
    );
  }
}
