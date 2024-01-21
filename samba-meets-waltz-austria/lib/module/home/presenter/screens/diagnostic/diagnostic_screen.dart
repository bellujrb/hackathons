// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/colors.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/bottom_navigator.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/container_item_position.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/container_item_position_long.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({super.key});

  @override
  State<DiagnosticScreen> createState() => _DiagnosticScreenState();
}

class _DiagnosticScreenState extends State<DiagnosticScreen> {
  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: context.mediaWidth * 0.4,
          title: Text(
            "Position",
            style: GoogleFonts.inter(textStyle: styleModifier.smallPlusBlack),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Modular.to.navigate("jobs"),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 24,
                  color: AppColors.secondaryBlue,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Jobs",
                  style: GoogleFonts.inter(textStyle: styleModifier.mediumBlue),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "Microelectronics Engineer",
                    style:
                        GoogleFonts.inter(textStyle: styleModifier.mediumBlack),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "Vienna",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "OVERVIEW",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "As a Semiconductor Process Engineer, you will play a crucial role in our semiconductor fabrication process. You will be responsible for optimizing and maintaining semiconductor manufacturing processes, ensuring product quality, and contributing to the development of next-generation semiconductor technologies.",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _isShow
                    ? ItemInfoIncomplet(
                        title: "QUALIFICATIONS",
                        onPressed: () {
                          setState(() {
                            _isShow = !_isShow;
                          });
                        },
                      )
                    : ItemInfoComplet(
                        onPressed: () {
                          setState(() {
                            _isShow = !_isShow;
                          });
                        },
                      ),
                const SizedBox(
                  height: 20,
                ),
                ItemInfoIncomplet(title: "KEY RESPONSABILITIES"),
                const SizedBox(
                  height: 20,
                ),
                ItemInfoIncomplet(title: "BENEFITS"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: context.mediaWidth * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Text("Apply for this Position", style: GoogleFonts.inter(
                    textStyle: styleModifier.smallWhite
                  ),),
                )
              ],
            ),
          ),
        )));
  }
}

// ignore: must_be_immutable
class ItemInfoIncomplet extends StatelessWidget {
  final String title;
  void Function()? onPressed;
  ItemInfoIncomplet({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
      height: 45,
      width: context.mediaWidth * 0.9,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(textStyle: styleModifier.smallBlack),
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 24,
                color: AppColors.primaryBlack,
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemInfoComplet extends StatelessWidget {
  void Function()? onPressed;
  ItemInfoComplet({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
      alignment: Alignment.topRight,
      height: 600,
      width: context.mediaWidth * 0.9,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "QUALIFICATION",
                  style: GoogleFonts.inter(textStyle: styleModifier.smallBlack),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                    color: AppColors.primaryBlack,
                  ),
                  onPressed: onPressed,
                )
              ],
            ),
            ContainerItemPosition(
              title: "English 1C",
              color: const Color(0x1908A767),
              colorIcon: AppColors.primaryGreen,
              icon: Icons.verified,
              styleText: styleModifier.smallGreen,
            ),
            const SizedBox(
              height: 8,
            ),
            ContainerItemPositionLong(
              title: "Under-graduation in Engineer Eletronics or related",
              color: const Color(0x1908A767),
              colorIcon: AppColors.primaryGreen,
              icon: Icons.verified,
              styleText: styleModifier.smallGreen,
            ),
            const SizedBox(
              height: 8,
            ),
            ContainerItemPositionLong(
              title:
                  "Strong knowledge of semiconductor materials, fabrication techniques, and equipment.",
              color: const Color(0x1908A767),
              colorIcon: AppColors.primaryGreen,
              icon: Icons.verified,
              styleText: styleModifier.smallGreen,
            ),
            const SizedBox(
              height: 8,
            ),
            ContainerItemPosition(
              title: "German 1C",
              color: const Color(0x19FF8414),
              icon: Icons.warning,
              colorIcon: AppColors.primaryRed,
              styleText: styleModifier.smallOrange,
            ),
            const SizedBox(
              height: 8,
            ),
            ContainerItemPositionLong(
              title: "Excellent problem-solving and troubleshooting skills.",
              color: const Color(0x19FF8414),
              icon: Icons.warning,
              colorIcon: AppColors.primaryRed,
              styleText: styleModifier.smallOrange,
            ),
            const SizedBox(
              height: 8,
            ),
            ContainerItemPositionLong(
              title:
                  "Willingness to adapt to new technologies and methodologies..",
              color: const Color(0x19FF8414),
              icon: Icons.warning,
              colorIcon: AppColors.primaryRed,
              styleText: styleModifier.smallOrange,
            ),
          ],
        ),
      ),
    );
  }
}
