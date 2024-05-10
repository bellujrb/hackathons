import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/auth/presenter/widgets/button_sample.dart';
import 'package:frontend/module/home/presenter/widgets/build_appbar.dart';
import 'package:frontend/module/home/presenter/widgets/build_custom_bn.dart';
import 'package:frontend/module/home/presenter/widgets/card_fidelity.dart';
import 'package:frontend/module/home/presenter/widgets/card_fidelity_other.dart';
import 'package:frontend/module/home/presenter/widgets/transactions_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfacePrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CardFidelityOther(),
                  const SizedBox(
                    height: 20,
                  ),
                  QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: AppColors.onTertiary,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: context.mediaWidth * 0.9,
                    height: 64,
                    decoration: ShapeDecoration(
                      color: AppColors.backgroundInput,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF8859FE)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: TextFormField(
                      style: context.appTextStyles.smallWhite,
                      initialValue: "hsmp-thmo-thsn-hesh-fidz",
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(24),
                        border: InputBorder.none,
                        fillColor: AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonSample(
                    title: "Add to your device’s wallet",
                    callback: () {},
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CardFidelity(
                    callback: () => _showCustomBottomSheet(context),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
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
            const SizedBox(
              height: 10,
            ),
            const TransactionsWidget(
              img: "icon-convert.png",
              title: "Balance exchange",
              price: "12.96",
              priceConvert: "2",
              token: "FDZ",
              tokenConvert: "BURGER",
              date: "May 04",
            )
          ],
        ),
      ),
    );
  }
}
