import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:season/view/main/dashboard.dart';
import 'package:season/view/main/dashboard2.dart';
import 'package:season/view/main/settings.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List _screens = [
    const Dashboard(),
    const Dashboard2(),
    const Dashboard(),
    const Settings(),
    //  const OnBoardingHome(),
    //  const Application(),
    //  const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.surface,
            activeColor: Theme.of(context).colorScheme.shadow,
            tabBackgroundColor: Theme.of(context).colorScheme.onTertiary,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index; // Update the current index
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
