import 'package:app/core/ui/screens/auth/login/login_screen.dart';
import 'package:app/core/ui/screens/auth/login/register_screen.dart';
import 'package:app/core/ui/screens/home/options_home/dashboard.dart';
import 'package:app/core/ui/screens/home/options_home/historic_screen.dart';
import 'package:app/core/ui/screens/home/home_screen.dart';
import 'package:app/core/ui/screens/home/options_home/layout/layout_formater_screen.dart';
import 'package:app/core/ui/screens/home/options_home/layout/layout_screen.dart';
import 'package:app/core/ui/screens/home/options_home/shipping/process_screen.dart';
import 'package:app/core/ui/screens/home/options_home/shipping/sendarquive.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/ui/screens/auth/welcome/welcome_screen.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const WelcomeScreen()),
    ChildRoute('/login', child: (context, args) => LoginScreen()),
    ChildRoute('/register', child: (context, args) => RegisterScreen()),
    ChildRoute('/home', child: (context, args) => const HomeScreen()),
    ChildRoute('/dashboard', child: (context, args) => const DashboardScreen()),
    ChildRoute('/historic', child: ((context, args) => const HistoricScreen())),
    ChildRoute('/layout', child: ((context, args) => const LayoutScreen())),
    ChildRoute('/layoutformatter', child: (context, args) => const LayoutFormatterScreen()),
    ChildRoute('/sendarquive', child: (context, args) => const SendArquiveScreen()),
    ChildRoute('/process', child: (context, args) => const ProcessScreen()),
    RedirectRoute('/redirect', to: '/'),
  ];
}