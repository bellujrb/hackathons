import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/presenter/widgets/build_appbar.dart';
import 'package:frontend/module/home/presenter/widgets/build_custom_bn.dart';
import 'package:frontend/module/home/presenter/widgets/explore_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: AppColors.primary,
      body: SizedBox(
        height: context.mediaHeight * 1.0,
        width: context.mediaWidth * 1.0,
        child: Column(
          children: [
            Text(
              "Explore all reward programs",
              style: context.appTextStyles.miniSmallGray,
            ),
            const ExploreWidget(
              img: "explore_fidz.png",
              name: "Fidz",
              token: "FDZ",
            ),
            const SizedBox(
              height: 10,
            ),
            const ExploreWidget(
              img: "logo-burger.png",
              name: "Burger",
              token: "BURGER",
            )
          ],
        ),
      ),
    );
  }
}
