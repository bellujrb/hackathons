import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_arteris/core/extesions/build_context_utils.dart';
import 'package:hackathon_arteris/core/styles/colors.dart';
import 'package:hackathon_arteris/core/styles/text_style.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        leadingWidth: context.mediaWidth * 1.0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 35,
              width: 41,
              child: Image.asset('assets/logo.png'),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.navigate("/");
                  },
                  child: Text(
                    "Dashboard",
                    style: GoogleFonts.poppins(
                        textStyle: styleModifier.whiteSmall),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate("maps");
                  },
                  child: Text("Mapa",
                      style: GoogleFonts.poppins(
                          textStyle: styleModifier.whiteSmall)),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.notification_important_rounded,
                  color: AppColors.secondary,
                ),
                const SizedBox(
                  width: 20,
                ),
                const CircleAvatar(
                  child: Text("B"),
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 105,
                width: context.mediaWidth * 0.9,
                child: Image.asset('assets/mock-top.jpg'),
              ),
              SizedBox(
                height: 830,
                width: context.mediaWidth * 0.9,
                child: Image.asset('assets/mock-map.jpg'),
              ),
            ],
          ),
        )
      ),
    );
  }
}
