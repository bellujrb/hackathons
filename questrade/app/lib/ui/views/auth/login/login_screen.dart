import 'package:app/core/controller/auth/login_controller.dart';
import 'package:app/ui/components/input.dart';
import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = Modular.get<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 117,
                  height: 53,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                        controller: controller.controlEmail,
                        validation: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "The value must be filled in.";
                          }
                          return null;
                        },
                        title: 'E-mail',
                        label: "Type your e-mail",
                        type: TextInputType.text,
                        width: context.mediaWidth * 0.9),
                    Input(
                      controller: controller.controlPassword,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "The value must be filled in.";
                        }
                        return null;
                      },
                      title: 'Password',
                      label: "Type your password",
                      type: TextInputType.text,
                      width: context.mediaWidth * 0.9,
                      secureText: true,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await controller.auth();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: context.mediaWidth * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    "Enter with account",
                    style: GoogleFonts.poppins(
                        textStyle: context.styleModifier.textMediumBoldWhite),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not account?",
                    style: GoogleFonts.poppins(
                        textStyle: context.styleModifier.textMediumCommonGray),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.navigate('register');
                    },
                    child: Text(
                      "Create now",
                      style: GoogleFonts.poppins(
                          textStyle: context.styleModifier.textMediumBoldBlack),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
