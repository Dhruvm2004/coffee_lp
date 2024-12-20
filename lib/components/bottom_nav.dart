import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lp_2024/components/cart.dart';
import 'package:lp_2024/components/profile.dart';
import 'package:lp_2024/pages/cold_page.dart';
import 'package:lp_2024/pages/first_page.dart';
import 'package:lp_2024/pages/food_page.dart';
import 'package:lp_2024/pages/front_page.dart';
import 'package:lp_2024/pages/hot_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    FirstPage(),
    // HotPage(),
    // ColdPage(),
    // FoodPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.brown,
          height: 80,
          elevation: 0,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ));
  }
}
