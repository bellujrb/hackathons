import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/module/auth/presenter/screens/login_screen.dart';
import 'package:frontend/module/auth/presenter/screens/welcome_screen.dart';
import 'package:frontend/module/auth/presenter/screens/splash_screen.dart';

class AuthModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    ChildRoute('/welcome', child: (context, args) => const WelcomeScreen()),
    ChildRoute('/login', child: (context, args) => const LoginScreen())
  ];
}