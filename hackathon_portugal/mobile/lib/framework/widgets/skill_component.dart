import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_portugal/utils/build_context_utils.dart';
import 'package:hackathon_portugal/utils/colors.dart';
import 'package:hackathon_portugal/utils/text_styles.dart';

class SkillComponent extends StatelessWidget {
  final String title;
  final String number;
  const SkillComponent({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: context.mediaWidth * 0.9,
      decoration: BoxDecoration(
          color: AppColors.onSecondary,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 56,
            width: 56,
            alignment: Alignment.center,
            child: const Icon(Icons.data_array),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 147,
                child: Text(
                  title,
                  style: GoogleFonts.chakraPetch(
                      textStyle: context.appTextStyles.smallBlack),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                number,
                style: GoogleFonts.chakraPetch(
                    textStyle: context.appTextStyles.mediumBlack),
              ),
            ],
          ),
          SizedBox(
            height: 56,
            width: 96,
            child: Image.asset("assets/graphic.png"),
          )
        ],
      ),
    );
  }
}
