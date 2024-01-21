import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';

import '../widgets/item_carrousel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemWidth: context.mediaWidth * 1.0,
        layout: SwiperLayout.DEFAULT,
        customLayoutOption: CustomLayoutOption(startIndex: 1, stateCount: 3)
            .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
          const Offset(-370.0, -40.0),
          const Offset(0.0, 0.0),
          const Offset(370.0, -40.0)
        ]),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SimpleItemCarrousel(
              title: "Discover opportunities in Austria",
              img: "assets/welcome1.png",
            );
          }
          if (index == 1) {
            return const SimpleItemCarrousel(
              title: "Boost your career with hiring trails",
              img: "assets/welcome2.png",
            );
          }
          if (index == 2) {
            return const ItemCarrousel(
              title: "Find a community for you to receive",
              img: "assets/welcome3.png",
            );
          } else {
            return const SizedBox();
          }
        },
        itemCount: 3,
      ),
    );
  }
}
