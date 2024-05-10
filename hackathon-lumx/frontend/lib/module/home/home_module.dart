import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/module/home/presenter/screens/exchange_screen.dart';
import 'package:frontend/module/home/presenter/screens/explore_screen.dart';
import 'package:frontend/module/home/presenter/screens/home_screen.dart';
import 'package:frontend/module/home/presenter/screens/market_place_screen.dart';
import 'package:frontend/module/home/presenter/screens/mint_screen.dart';
import 'package:frontend/module/home/presenter/screens/profile_screen.dart';
import 'package:frontend/module/home/presenter/screens/settings_screen.dart';

class HomeModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
    ChildRoute('/wallet', child: (context, args) => const HomeScreen()),
    ChildRoute('/explore', child: (context, args) => const ExploreScreen()),
    ChildRoute('/exchange', child: (context, args) => const ExchangeScreen()),
    ChildRoute('/mint', child: (context, args) => const MintScreen()),
    ChildRoute('/marketplace', child: (context, args) => const MarketPlaceScreen()),
    ChildRoute('/profile', child: (context, args) => const ProfileScreen()),
    ChildRoute('/settings', child: (context, args) => const SettingsScreen())
  ];
}