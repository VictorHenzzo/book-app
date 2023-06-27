import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).colorScheme.primary;
    final color = Theme.of(context).colorScheme.onSurface;

    return BottomNavigationBar(
      items: items(),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: activeColor,
      unselectedItemColor: color,
      selectedLabelStyle: const TextStyle(
        fontFamily: "Heebo",
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: "Heebo",
      ),
    );
  }

  List<BottomNavigationBarItem> items() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_filled,
        ),
        label: 'Início',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add_circle,
        ),
        label: 'Adicionar',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'Buscar',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: 'Favoritos',
      ),
    ];
  }
}
