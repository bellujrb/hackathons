import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) => buildNavItem(index)),
      ),
    );
  }

  Widget buildNavItem(int index) {
    bool isSelected = index == widget.selectedIndex;
    IconData iconData = Icons.wallet_travel;
    String label = '';
    String route = '';

    switch (index) {
      case 0:
        iconData = Icons.wallet_travel;
        label = 'Wallet';
        route = 'wallet';
        break;
      case 1:
        iconData = Icons.explore;
        label = 'Explore';
        route = 'explore';
        break;
      case 2:
        iconData = Icons.wallet_travel;
        label = 'Exchange';
        route = 'exchange';
        break;
      case 3:
        iconData = Icons.auto_awesome;
        label = 'Mine';
        route = 'mint';
        break;
    }

    return InkWell(
      onTap: () {
        widget.onItemSelected(index);
        Modular.to.navigate(route); 
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 60,
        alignment: Alignment.center,
        child: isSelected
            ? buildSelectedContainer(iconData, label)
            : buildUnselectedContainer(iconData, label),
      ),
    );
  }

  Widget buildSelectedContainer(IconData icon, String text) {
    return Container(
      width: 90,
      height: 66,
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(80),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildUnselectedContainer(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey[500]),
        Text(
          text,
          style: TextStyle(color: Colors.grey[500]),
        ),
      ],
    );
  }
}
