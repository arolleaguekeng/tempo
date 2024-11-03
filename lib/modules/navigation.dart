import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tempo/theme/theme_constants.dart';

import '../utils/constants.dart';
import 'music_generator/pages/tempochoice.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  static const String routeName = '/';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const Center(
      child: Text('First'),
    ),
    const Center(child: Text('Second')),
    const Center(
      child: Text('Third'),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      bottomNavigationBar: NavigationBar(
        height: 90,
        elevation: 1,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => _onItemTapped(value),
        backgroundColor: ThemeData == darkTheme ? secondaryColor : tonGray1,
        indicatorColor: primaryColor,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? white : textColor,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tempochoice(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              // Button color
              backgroundColor: primaryColor,
              // Splash color
              foregroundColor: white,
            ),
            child: const Icon(
              Icons.add,
              color: white,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.folder,
              color: _selectedIndex == 2 ? white : textColor,
            ),
            label: AppLocalizations.of(context)!.library,
          )
        ],
      ),
      body: _screen[_selectedIndex],
    );
  }
}
