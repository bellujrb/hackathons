import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../styles/colors.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          Container(
            width: context.mediaWidth * 1.0,
            height: 138,
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => Modular.to.navigate('home'),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.mediaHeight * 0.05,
          ),
          Center(
            child: Text(
              "Historico",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textTitleBigBlackBold),
            ),
          ),
          Center(
            child: SizedBox(
              width: 900,
              height: 450,
              child: Image.asset('historic.png'),
            ),
          ),
        ],
      ),
    );
  }
}
