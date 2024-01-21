import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../styles/colors.dart';

class CustomToggle extends StatelessWidget {
  const CustomToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 70,
      minHeight: 22.0,
      fontSize: 12.0,
      initialLabelIndex: 1,
      activeBgColor: [AppColors.primary],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: 2,
      labels: const ['Real', 'Dollar'],
      customTextStyles: [
        GoogleFonts.poppins(
            textStyle: context.styleModifier.textMediumBoldWhite),
        GoogleFonts.poppins(
            textStyle: context.styleModifier.textMediumBoldWhite),
      ],
      onToggle: (index) {
        if(index == 1){
          print("Function not implemented");
        }
      },
    );
  }
}