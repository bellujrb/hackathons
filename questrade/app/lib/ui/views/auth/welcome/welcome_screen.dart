import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Center(
            child: SizedBox(
              width: 236.34,
              height: 110,
              child: Image.asset('assets/logo.png'),
            ),
          ),
        )
    );
  }
}