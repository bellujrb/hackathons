import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_portugal/utils/text_styles.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 72,
              width: 72,
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your education of the future",
              style: GoogleFonts.chakraPetch(
                  textStyle: context.appTextStyles.smallGray),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Modular.to.navigate("home");
              },
              child: SizedBox(
                height: 158,
                width: 145,
                child: Image.asset("assets/nfc.png"),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Connect with Pen",
              style: GoogleFonts.chakraPetch(
                  textStyle: context.appTextStyles.smallGray),
            ),
          ],
        ),
      ),
    );
  }
}
