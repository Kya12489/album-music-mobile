import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tp2/widget/customIcon.dart';

class Bottombar_P extends StatelessWidget {
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const Bottombar_P({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  // Empeche l'utilisateur de naviguer vers le QCM s'il n'est pas connecté
 

  @override
  Widget build(BuildContext context) {
    // Construction de la barre de navigation 
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => onDestinationSelected(index),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: const [
        NavigationDestination(
            icon: Icon(Icons.home_outlined), 
            selectedIcon: Icon(Icons.home),
            label: "Accueil"
          ),
          NavigationDestination(
            icon: Icon(CustomIcons.double_note_outlined), 
            selectedIcon: Icon(CustomIcons.double_note),
            label: "Liste albums"
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined), 
            selectedIcon: Icon(Icons.settings),
            label: "Parametre"
          ),
        
      ],
    );
  }
}
