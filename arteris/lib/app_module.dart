import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_arteris/module/home/presenter/pages/home_page.dart';
import 'package:hackathon_arteris/module/home/presenter/pages/maps_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ChildRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/maps', child: (contexxt, args) => const MapsPage())
      ];
}