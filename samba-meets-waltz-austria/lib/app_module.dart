import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_austria/module/home/home_module.dart';
import 'package:hackathon_austria/module/welcome/welcome_module.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: WelcomeModule()),
    ModuleRoute('/home', module: HomeModule())
  ];
}