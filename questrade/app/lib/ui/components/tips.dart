import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:app/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tips",
          style: GoogleFonts.poppins(
              textStyle: context.styleModifier.textMediumBoldBlack),
        ),
        const SizedBox(
          height: 6.5,
        ),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ItemTips(
                  text: "Before applying for a loan, carefully assess your need",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ItemTips(
                  text: "Analyze your current income, expenses",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ItemTips(
                  text: "Your credit score plays an important role in getting a loan.",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ItemTips(
                  text: "Before signing any loan agreement, please read the terms and conditions carefully.",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ItemTips extends StatelessWidget {
  final String text;
  const ItemTips({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: context.mediaWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.tertiary, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.real_estate_agent),
          SizedBox(
            width: context.mediaWidth * 0.5,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  textStyle: context.styleModifier.textSmallCommonBlack),
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/tips.png'),
          ),
        ],
      ),
    );
  }
}
