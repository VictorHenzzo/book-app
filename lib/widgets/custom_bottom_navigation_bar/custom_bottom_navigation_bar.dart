import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).colorScheme.primary;
    final color = Theme.of(context).colorScheme.onSurface;

    return BottomNavigationBar(
      items: items(),
      selectedItemColor: activeColor,
      unselectedItemColor: color,
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
