import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final String? route;
  const Button({Key? key, required this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Modular.to.navigate(route!)
      },
      child: Container(
        width: context.mediaWidth * 0.9,
        height: context.mediaHeight * 0.06,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12)
        ),
        alignment: AlignmentDirectional.center,
        child: Text(title, style: GoogleFonts.poppins(
          textStyle: context.appTextStyles.titleButton
        ),),
      ),
    );
  }
}