import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/card_info.dart';
import '../../../components/header.dart';
import '../../../components/status_score.dart';
import '../../../styles/colors.dart';

class PerfomedLoanScreen extends StatelessWidget {
  const PerfomedLoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(title: "Joint Loan"),
                SizedBox(
                  height: context.mediaHeight * 0.03,
                ),
                const InfoCard(
                  title: "Support",
                  subtitle:
                      "No Recognize a loan? contact our support via email.",
                  img: 'assets/boy.png',
                ),
                SizedBox(
                  height: context.mediaHeight * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Success",
                        style: GoogleFonts.poppins(
                            textStyle:
                                context.styleModifier.textMediumBoldBlack),
                      ),
                      Container(
                        height: 1,
                        width: context.mediaWidth * 0.7,
                        decoration: BoxDecoration(color: AppColors.primary),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.mediaHeight * 0.4,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      ItemSuccess(),
                      ItemSuccess(),
                      ItemSuccess(),
                    ],
                  ),
                ),
                const StatusScore()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemSuccess extends StatelessWidget {
  const ItemSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: context.mediaWidth * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 52,
            height: 24,
            child: Image.asset('assets/logo.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "12 Installments",
                style: GoogleFonts.poppins(
                    textStyle: context.styleModifier.textMediumBoldBlack),
              ),
              Text(
                "Loan Accounts",
                style: GoogleFonts.poppins(
                    textStyle: context.styleModifier.textMediumCommonGray),
              )
            ],
          ),
          Text(
            "USD 1265.00",
            style: GoogleFonts.poppins(
                textStyle: context.styleModifier.textMediumBoldBlack),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
