import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_austria/module/welcome/presenter/screens/welcome_screen.dart';

class WelcomeModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const WelcomeScreen())
  ];
}