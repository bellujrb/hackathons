import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/styles/colors.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    backgroundColor: AppColors.primary,
    title: InkWell(
      onTap: () => Modular.to.navigate("profile"),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset("assets/img/profile.png"),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Container(
          height: 40,
          width: 132,
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const Text(
            "Invite and win",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Icon(
        Icons.notifications,
        color: AppColors.tertiary,
      ),
      const SizedBox(
        width: 10,
      ),
      Icon(
        Icons.logout,
        color: AppColors.tertiary,
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
