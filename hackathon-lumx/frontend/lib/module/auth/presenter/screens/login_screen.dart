import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/auth/presenter/widgets/button_signin.dart';
import 'package:frontend/module/auth/presenter/widgets/input_email.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.primary,
        height: context.mediaHeight * 1.0,
        width: context.mediaWidth * 1.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 191.98,
                width: 335,
                child: Image.asset("assets/img/composition.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonSignIn(
                img: "metamask.png",
                title: "Sign in with Metamask",
                callback: () {
                  Modular.to.navigate("home");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonSignIn(
                img: "google.png",
                title: "Sign in with Google",
                callback: () {
                  Modular.to.navigate("home");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonSignIn(
                img: "microsoft.png",
                title: "Sign in with Microsoft",
                callback: () {
                  Modular.to.navigate("home");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonSignIn(
                img: "facebook.png",
                title: "Sign in with Facebook",
                callback: () {
                  Modular.to.navigate("home");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Modular.to.navigate("home");
                },
                child: Text(
                  "Or sign in with e-mail",
                  style: context.appTextStyles.smallGray,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InputEmail(title: "Email", controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
