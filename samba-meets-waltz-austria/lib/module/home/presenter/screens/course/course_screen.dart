import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/text_styles.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/bottom_navigator.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/course_item.dart';

import '../../../../../core/styles/colors.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        bottomNavigationBar: const BottomNavigationWidget(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learning Path",
                      style:
                          GoogleFonts.inter(textStyle: styleModifier.mediumRed),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 121,
                      height: 25,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, -0.02),
                            end: Alignment(-1, 0.02),
                            colors: [Color(0xFFEBC420), Color(0xFFFFB13D)],
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "Gold Student",
                        style: GoogleFonts.inter(
                            textStyle: styleModifier.specialText),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  width: context.mediaWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: context.mediaWidth * 0.7,
                          child: Text(
                            "Digital Filter Optimization And Assembler",
                            style: GoogleFonts.inter(
                                textStyle: styleModifier.mediumBlack),
                          ),
                        ),
                        Text(
                          "LEADERBOARD",
                          style: GoogleFonts.inter(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const ItemRank(
                              name: "John Doe",
                              pet: "assets/placetwo.png",
                              place: "assets/medal.png",
                              color: Color(0xFF0047FF),
                            ),
                            ItemRank(
                              name: "You",
                              pet: "assets/pet2.png",
                              place: "assets/medal3.png",
                              color: AppColors.primaryRed,
                            ),
                            ItemRank(
                              name: "Juli Fross",
                              pet: "assets/pet3.png",
                              place: "assets/medal2.png",
                              color: AppColors.primaryGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 36,
                  width: context.mediaWidth * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryGray,
                    borderRadius: BorderRadius.circular(8)
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Search",
                          style: GoogleFonts.inter(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 5
                        ),
                        child: Icon(
                          Icons.mic,
                          size: 24,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CourseItem(
                  title: "Austria Capacitors Essentials Trainings ",
                  subtitle: "Level 21",
                  porcent: "13%",
                ),
                const SizedBox(
                  height: 8,
                ),
                const CourseItem(
                  title: "German ",
                  subtitle: "B2",
                  porcent: "90%",
                ),
                const SizedBox(
                  height: 8,
                ),
                const CourseItem(
                  title: "Small and micro drives ",
                  subtitle: "Level 3",
                  porcent: "5%",
                ),
                const SizedBox(
                  height: 8,
                ),
                const CourseItem(
                  title: "English",
                  subtitle: "ADVANCED",
                  porcent: "87%",
                ),
                const SizedBox(
                  height: 8,
                ),
                const CourseItem(
                  title: "Intelligent sensor systems",
                  subtitle: "LEVEL 14",
                  porcent: "63%",
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class ItemRank extends StatelessWidget {
  final String name;
  final String pet;
  final String place;
  final Color? color;
  const ItemRank(
      {super.key,
      required this.name,
      required this.pet,
      required this.place,
      this.color});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 82,
          height: 82,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(pet),
          ),
        ),
        Transform.translate(
          offset: const Offset(22.0, -20.0),
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(place),
          ),
        ),
        Text(
          name,
          style: GoogleFonts.inter(textStyle: styleModifier.smallBlack),
        )
      ],
    );
  }
}
