import 'package:app/ui/views/auth/login/login_screen.dart';
import 'package:app/ui/views/auth/register/register_screen.dart';
import 'package:app/ui/views/auth/welcome/welcome_screen.dart';
import 'package:app/ui/views/home/home_screen.dart';
import 'package:app/ui/views/home/joint_loan/joint_loan_screen.dart';
import 'package:app/ui/views/home/pendencies_loan/pendencies_screen.dart';
import 'package:app/ui/views/home/performed_loan/perfomed_loan_screen.dart';
import 'package:app/ui/views/home/request_loan/request_loan_screen.dart';
import 'package:app/ui/views/home/success_loan/success_loan_screen.dart';
import 'package:app/ui/views/home/support/support_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/controller/auth/login_controller.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => LoginController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const WelcomeScreen()),
    ChildRoute('/login', child: (context, args) => const LoginScreen()),
    ChildRoute('/register', child: (context, args) => const RegisterScreen()),
    ChildRoute('/home', child: (context, args) => const HomeScreen()),
    ChildRoute('/requestloan', child: (context, args) => const RequestLoanScreen()),
    ChildRoute('/successloan', child: (context, args) => const SuccessLoanScreen()),
    ChildRoute('/perfomedloan', child: (context, args) => const PerfomedLoanScreen()),
    ChildRoute('/pendencies', child: (context, args) => const PendenciesLoanScreen()),
    ChildRoute('/jointloan', child: (context, args) => const JointLoanScreen()),
    ChildRoute('/support', child: (context, args) => const SupportScreen())
  ];
}