import 'package:app/core/controller/login_controller.dart';
import 'package:app/core/ui/components_global/input.dart';
import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.onPrimary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: context.mediaWidth * 0.98,
                    height: 272,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Image.asset('assets/logo.png')),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0.0, -85.0),
                child: Container(
                  width: context.mediaWidth * 0.3,
                  height: context.mediaHeight * 0.5,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.mediaHeight * 0.1,
                      ),
                      Text(
                        "Entrar",
                        style: GoogleFonts.poppins(
                            textStyle: context.appTextStyles.textBoldBlackBig),
                      ),
                      SizedBox(
                        height: context.mediaHeight * 0.02,
                      ),
                      const Input(
                        title: 'Codigo de Acesso',
                        label: "Digite seu Codigo",
                        type: TextInputType.name,
                      ),
                      SizedBox(
                        height: context.mediaHeight * 0.02,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Modular.to.navigate('home');
                        },
                        child: Container(
                          width: 350,
                          height: context.mediaHeight * 0.06,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "Entrar",
                            style: GoogleFonts.poppins(
                                textStyle: context.appTextStyles.titleButton),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.mediaHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Não tem uma conta ?",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    context.appTextStyles.textSubtitleGray),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.to.navigate('register');
                            },
                            child: Text(
                              "Crie Agora",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      context.appTextStyles.textAccountOrange),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
