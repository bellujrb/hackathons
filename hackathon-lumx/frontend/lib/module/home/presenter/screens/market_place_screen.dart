import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';
import 'package:frontend/module/home/presenter/widgets/marketplace_widget.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {

  // ignore: unused_element
  void _showMarketPlaceModal() {
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
                  "Benefit redeemed",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "#492394294",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const Text(
                  "Present this code at the venue.",
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

  final List<Map<String, String>> products = [
    {
      "img": "burger-img1.png",
      "name": "Simple Cheeseburger",
      "price": "5",
      "token": "BURGER"
    },
    {
      "img": "burger-img2.png",
      "name": "Double Bacon Hamburger",
      "price": "10",
      "token": "BURGER"
    },
    {
      "img": "burger-img3.png",
      "name": "Exclusive Burgito NFT",
      "price": "30",
      "token": "BURGER"
    },
    {
      "img": "burger-img4.png",
      "name": "Exclusive Burgita T-shirt",
      "price": "60",
      "token": "BURGER"
    },
  ];

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 64,
              width: 64,
              child: Image.asset("assets/img/logo-burger.png"),
            ),
            const SizedBox(height: 10),
            Text(
              "Current Balance",
              style: context.appTextStyles.smallGray,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "20",
                  style: context.appTextStyles.bigWhite,
                ),
                const SizedBox(width: 5),
                const Text(
                  "\$BURGER",
                  style: TextStyle(color: Color(0xFFF8FAFC), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: context.mediaHeight * 1.0,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(20),
                children: products.map((product) {
                  return MarketPlaceWidget(
                    img: product["img"]!,
                    name: product["name"]!,
                    price: product["price"]!,
                    token: product["token"]!,
                    callback: _showMarketPlaceModal,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
