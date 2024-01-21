import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(
                  width: 186,
                  height: 186,
                  child: Image.asset('assets/supporticon.png'),
                ),
                SizedBox(
                  width: context.mediaWidth * 0.8,
                  child: Column(
                    children: [
                      Text(
                        "Support",
                        style: GoogleFonts.poppins(
                            textStyle: context.styleModifier.textMediumBoldBlack),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "To contact support, please copy the email in the button below.",
                          style: GoogleFonts.poppins(
                              textStyle:
                              context.styleModifier.textMediumCommonGray),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: context.mediaWidth * 0.8,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "Copy e-mail",
                      style: GoogleFonts.poppins(
                        textStyle: context.styleModifier.textMediumCommonWhite,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Modular.to.navigate('home');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: context.mediaWidth * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "Return home page",
                      style: GoogleFonts.poppins(
                        textStyle: context.styleModifier.textMediumBoldWhite,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
