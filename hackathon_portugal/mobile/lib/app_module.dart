import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_portugal/framework/screens/auth_screen.dart';
import 'package:hackathon_portugal/framework/screens/home_screen.dart';
class AppModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const AuthScreen()),
    ChildRoute('/home', child: (context, args) => const HomeScreen())
  ];
}