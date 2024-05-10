import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/auth/presenter/widgets/button_sample.dart';
import 'package:frontend/module/home/presenter/widgets/build_custom_bn.dart';
import 'package:frontend/module/home/presenter/widgets/input_convert.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  int _selectedIndex = 2;

  void _showExchangeModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            width: 335,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.surfacePrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Icon(Icons.check_circle, size: 40, color: Colors.green),
                ),
                const Text(
                  "Balance exchanged",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "- 12.9% FDZ = + 2 FTS",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const Text(
                  "Your balance have been updated on your wallet",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Modular.to.navigate("wallet"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 10,
        elevation: 0,
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Modular.to.navigate("wallet"),
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset('assets/img/icon_arrowleft.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "How much do you want \nto convert?",
              style: context.appTextStyles.bigWhite,
            ),
            const SizedBox(
              height: 20,
            ),
            const InputConvert(
              title: "Convert",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your current balance of: 5.396 FDZ",
              style: context.appTextStyles.smallWhite,
            ),
            const SizedBox(
              height: 10,
            ),
            const InputConvert(
              title: "To",
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonSample(
              title: "Continue",
              callback: _showExchangeModal, 
            )
          ],
        ),
      ),
    );
  }
}
