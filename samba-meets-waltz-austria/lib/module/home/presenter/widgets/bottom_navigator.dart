import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/colors.dart';

import 'package:flutter/foundation.dart';

class NavigationState with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();

  }}

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();

}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final navigationState = Provider.of<NavigationState>(context);
    return BottomNavigationBar(
      currentIndex: navigationState.currentIndex,
      onTap: (index) {
        navigationState.updateIndex(index); 

        if (index == 0) {
          Modular.to.navigate("courses");
        } else if (index == 1) {
          Modular.to.navigate("jobs");
        } else if (index == 2) {
          Modular.to.navigate("community");
        } 
      },
      backgroundColor: const Color(0xFFF9F9F9),
      unselectedItemColor: AppColors.secondaryGray,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Community',
        ),
      ],
      selectedItemColor: AppColors.primaryBlue,
    );
  }
}