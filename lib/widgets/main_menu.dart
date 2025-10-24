import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MainMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.deepOrangeAccent,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: "Integrantes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: "Acerca de",
        ),
      ],
    );
  }
}
