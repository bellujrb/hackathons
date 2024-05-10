import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/presenter/widgets/build_custom_bn.dart';
import 'package:frontend/module/home/presenter/widgets/mine_time.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MintScreen extends StatefulWidget {
  const MintScreen({super.key});

  @override
  State<MintScreen> createState() => _MintScreenState();
}

class _MintScreenState extends State<MintScreen> {
  int _selectedIndex = 3;
  double value = 5.396;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/img/logo-clean.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Current Balance",
              style: context.appTextStyles.miniSmallGray,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.toString(),
                  style: context.appTextStyles.superBigWhite,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Row(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                    ),
                    Text(
                      "FDZ",
                      style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 32.0, 
                animationDuration: 2500,
                percent: 0.8,
                center:
                    const Text("Payout 80.0%", style: TextStyle(color: Colors.white)),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey[300]!,
                barRadius: const Radius.circular(80),
                linearGradient: const LinearGradient(
                  colors: [
                    Color(0xFF843DFF), 
                    Color(0xFFFF649A), 
                  ],
                ),
              ),
            ),
            SizedBox(
              width: context.mediaWidth * 0.8,
              child: Text(
                "You haven’t reached the minimum payout yet. The minimum payout is 10 FDZ",
                style: context.appTextStyles.smallGray,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: context.mediaWidth * 0.85,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Statistics",
                  style: context.appTextStyles.superSmallWhite,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: context.appTextStyles.smallPink,
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MineTimeWidget()
          ],
        ),
      ),
    );
  }
}
