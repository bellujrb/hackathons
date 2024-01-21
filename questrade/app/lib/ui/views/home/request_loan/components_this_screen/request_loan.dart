import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../components/input.dart';
import '../../../../styles/colors.dart';
import 'custom_toggle.dart';

class RequestLoan extends StatefulWidget {
  final int? loan;
  const RequestLoan({Key? key, required this.loan}) : super(key: key);

  @override
  State<RequestLoan> createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaWidth * 0.9,
      height: context.mediaHeight * 0.3,
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Input(
            title: "Name Loan",
            label: "Enter your name loan",
            type: TextInputType.text,
            width: context.mediaWidth * 0.8,
          ),
          const CustomToggle(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "USD",
                  style: GoogleFonts.poppins(
                    textStyle: context.appTextStyles.textSmallCommonBlack,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${widget.loan}",
                style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textBigBoldBlack,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: context.mediaWidth * 0.8,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: 1.0,
              center: Text(
                "max value loan ${widget.loan ?? ''}",
              ),
              progressColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}