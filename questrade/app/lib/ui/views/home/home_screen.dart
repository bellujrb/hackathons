import 'package:app/core/controller/home/home_controller.dart';
import 'package:app/core/controller/home/score_controller.dart';
import 'package:app/ui/components/icon_navigation.dart';
import 'package:app/ui/components/image_user.dart';
import 'package:app/ui/components/status_score.dart';
import 'package:app/ui/components/tips.dart';
import 'package:app/ui/extensions/build_context_utils.dart';
import 'package:app/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../../core/controller/auth/login_controller.dart';
import '../../components/card_with_score.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LoginController controller;
  final home = HomeController();
  final score = ScoreController();
  Logger log = Logger();

  String? name;
  int? balance;

  int? min;
  int? max;


  @override
  void initState() {
    super.initState();
    controller = Modular.get<LoginController>();
    home.getData().then((_) {
      setState(() {
        name = home.name;
        balance = home.current;
      });
      log.i("Request ON - Home");
    });
    score.getData().then((_) {
      setState(() {
        min = score.min;
        max = score.max;
      });
      log.i("Request ON - Score");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Header(
                      name: home.name,
                      function: () async {
                        await controller.logout();
                      },
                    ),
                    SizedBox(
                      height: context.mediaHeight * 0.027,
                    ),
                    CardWithScore(loan: home.loan, min: score.min, max: score.max,),
                    SizedBox(
                      height: context.mediaHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconNavigation(
                          title: 'Request Loan',
                          icon: Icons.request_page,
                          function: () {
                            Modular.to.navigate('requestloan');
                          },
                        ),
                        IconNavigation(
                          title: 'Loan Hired',
                          icon: Icons.contact_mail,
                          function: () {
                            Modular.to.navigate('perfomedloan');
                          },
                        ),
                        IconNavigation(
                          title: 'Pendencies',
                          icon: Icons.receipt_long,
                          function: () {
                            Modular.to.navigate('pendencies');
                          },
                        ),
                        IconNavigation(
                          title: 'Joint Loan',
                          icon: Icons.family_restroom,
                          function: () {
                            Modular.to.navigate('jointloan');
                          },
                        ),
                        IconNavigation(
                          title: 'Support',
                          icon: Icons.support_agent,
                          function: () {
                            Modular.to.navigate('support');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.mediaHeight * 0.03,
                    ),
                    const Tips(),
                  ],
                ),
              ),
              const StatusScore()
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  final String? name;
  final Function? function;
  const Header({Key? key, this.function, required this.name}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImgUser(),
        const SizedBox(
          width: 30,
        ),
        Text(
          widget.name ?? '',
          style: GoogleFonts.poppins(
            textStyle: context.styleModifier.textMediumBoldBlack,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.login_outlined),
          onPressed: () {
            widget.function;
          },
        ),
        SizedBox(
          width: context.mediaWidth * 0.05,
        ),
        SizedBox(
          width: 75,
          height: 35,
          child: Image.asset('assets/logo.png'),
        ),
      ],
    );
  }
}
