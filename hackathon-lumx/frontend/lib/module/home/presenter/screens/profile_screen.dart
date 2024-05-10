import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/module/home/presenter/widgets/settings_menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 40,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Modular.to.navigate("wallet"),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/img/icon_arrowleft.png'),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: SizedBox(
        height: context.mediaHeight * 1.0,
        width: context.mediaWidth * 1.0,
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: 244,
              child: Image.asset("assets/img/photo-profile.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsMenuItem(
              title: "Personal data",
              onTap: () {},
              img: "personal-icon.png",
            ),
            SettingsMenuItem(
              title: "Settings",
              onTap: () {
                Modular.to.navigate("settings");
              },
              img: "settings-icon.png",
            ),
            SettingsMenuItem(
              title: "Privacy and security",
              onTap: () {},
              img: "security-icon.png",
            ),
            SettingsMenuItem(
              title: "Help",
              onTap: () {},
              img: "help-icon.png",
            ),
            SettingsMenuItem(
              title: "Logout",
              onTap: () {
                Modular.to.navigate("/");
              },
              img: "logout-icon.png",
            ),
          ],
        ),
      ),
    );
  }
}
