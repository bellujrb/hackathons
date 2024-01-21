import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/card_info.dart';
import '../../../components/header.dart';
import '../../../components/status_score.dart';
import '../../../styles/colors.dart';

class PendenciesLoanScreen extends StatelessWidget {
  const PendenciesLoanScreen({Key? key}) : super(key: key);

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
                const Header(title: "Pendencies"),
                SizedBox(
                  height: context.mediaHeight * 0.03,
                ),
                const InfoCard(
                    title: "Support",
                    subtitle: "Did you pay the installment by any chance? If it was not accounted for, contact our support by email..",
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
                        "In Open",
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
                "Installments 1/12",
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "USD 1265.00",
                style: GoogleFonts.poppins(
                    textStyle: context.styleModifier.textMediumBoldBlack),
              ),
              Container(
                alignment: Alignment.center,
                width: 82,
                height: 21,
                decoration: BoxDecoration(
                  color: AppColors.onSecondary,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("Pay", style: GoogleFonts.poppins(
                  textStyle: context.styleModifier.textMediumCommonWhite
                ),),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}


