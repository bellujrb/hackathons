import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../styles/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.navigate('login');
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: SizedBox(
            width: 300.62,
            height: 200,
        child: Image.asset('assets/logo.png'),
      )),
    );
  }
}
