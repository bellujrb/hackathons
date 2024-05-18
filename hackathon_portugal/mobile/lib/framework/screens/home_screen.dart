import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_portugal/framework/widgets/skill_component.dart';
import 'package:hackathon_portugal/utils/build_context_utils.dart';
import 'package:hackathon_portugal/utils/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Modular.to.navigate("/");
              },
              child: Container(
                alignment: Alignment.centerRight,
                width: context.mediaWidth * 1.0,
                child: const Icon(Icons.logout),
              ),
            ),
            SizedBox(
              height: 300,
              width: 348,
              child: Image.asset("assets/pen-status.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Statistics Performance",
              style: GoogleFonts.chakraPetch(
                  textStyle: context.appTextStyles.smallBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 244,
              width: 343,
              child: Image.asset("assets/perfomance.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Skills",
              style: GoogleFonts.chakraPetch(
                  textStyle: context.appTextStyles.smallBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            const SkillComponent(
              title: "Language and Communication",
              number: "8.3",
            ),
            const SizedBox(
              height: 10,
            ),
            const SkillComponent(
              title: "Pre-mathematics",
              number: "4.3",
            ),
            const SizedBox(
              height: 10,
            ),
            const SkillComponent(
              title: "Natural Sciences",
              number: "9.3",
            ),
            const SizedBox(
              height: 10,
            ),
            const SkillComponent(
              title: "Visual Arts and Creativity",
              number: "9.6",
            ),
          ],
        ),
      ),
    ));
  }
}
