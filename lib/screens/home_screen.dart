import 'package:anime_world_tutorial/screens/animes_screen.dart';
import 'package:anime_world_tutorial/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'categories_screen.dart';
import 'settings_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.index,
  });

  final int? index;

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    if(widget.index !=null){
      _selectedIndex = widget.index!;
    }
    super.initState();
  }
  
  final _destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    const NavigationDestination(
        icon: Icon(Icons.category), label: 'Categories'),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final _screens = const [
    AnimesScreen(),
    SearchScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 12,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value) {
          HapticFeedback.heavyImpact();
          setState(() {
            _selectedIndex = value;
          });
        },
        ),
    );
  }
}