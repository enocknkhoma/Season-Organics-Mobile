import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:season/view/admin/add_user.dart';
import 'package:season/view/admin/adminDashboard.dart';
import 'package:season/view/admin/order.dart';
import 'package:season/view/admin/product.dart';
import 'package:season/view/main/dashboard.dart';
import 'package:season/view/main/settings.dart';

class BottomNavBarAdmin extends StatefulWidget {
  @override
  _BottomNavBarAdminState createState() => _BottomNavBarAdminState();
}

class _BottomNavBarAdminState extends State<BottomNavBarAdmin> {
  int _currentIndex = 0;

  final List _screens = [
    const AdminDashboard(),
    const Orders(),
    const ProductManagement(),
    const AddUser(),
    const Settings(),
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
                icon: Icons.shopping_basket_outlined,
                text: 'Orders',
              ),
              GButton(
                icon: Icons.add_shopping_cart,
                text: 'Product',
              ),
              GButton(
                icon: Icons.supervisor_account_sharp,
                text: 'Users',
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
