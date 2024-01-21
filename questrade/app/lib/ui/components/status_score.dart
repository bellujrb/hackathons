import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class StatusScore extends StatelessWidget {
  const StatusScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaWidth * 1.0,
      height: context.mediaHeight * 0.2,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Container(
        width: context.mediaWidth * 0.9,
        height: context.mediaHeight * 0.15,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.onPrimary, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.mediaWidth * 0.3,
              child: SizedBox(
                width: 196.4,
                height: 131,
                child: Image.asset('assets/girlstatus.png'),
              ),
            ),
            SizedBox(
              width: context.mediaWidth * 0.5,
              height: context.mediaHeight * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Congratulations!",
                    style: GoogleFonts.poppins(
                        textStyle:
                        context.styleModifier.textMediumBoldWhite),
                  ),
                  Text(
                    "Your score has a good score! keep it up",
                    style: GoogleFonts.poppins(
                        textStyle: context.styleModifier.textMediumCommonWhite),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
