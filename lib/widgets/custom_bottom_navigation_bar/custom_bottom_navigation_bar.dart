import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectedItemColor = Theme.of(context).colorScheme.primary;
    final unselectedItemColor = Theme.of(context).colorScheme.onSurface;

    return BottomNavigationBar(
      items: _items(),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Heebo',
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Heebo',
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
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
