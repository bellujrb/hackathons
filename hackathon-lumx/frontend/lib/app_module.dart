import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/module/auth/auth_module.dart';
import 'package:frontend/module/home/home_module.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule())
  ];
}