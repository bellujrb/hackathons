import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Modular.to.navigate("/home");
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                textStyle: context.styleModifier.textMediumBoldBlack),
          ),
          SizedBox(
            width: 75,
            height: 35,
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
    );
  }
}