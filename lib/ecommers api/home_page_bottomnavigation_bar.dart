import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/account_info.dart/login_page.dart';
import 'package:thinkpool/ecommers%20api/add_to_cart.dart/cart_page.dart';
import 'package:thinkpool/ecommers%20api/home_clone_page.dart';
import 'package:thinkpool/ecommers%20api/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pages = [
    const HomeClone(),
    const SearchPage(),
    CartPage(),
    const LoginPage()
  ];
  var currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: FloatingNavbar(
          selectedItemColor: Colors.green.shade600,
          unselectedItemColor: Colors.green.shade600,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: [
            FloatingNavbarItem(
              icon: Icons.home_outlined,
            ),
            FloatingNavbarItem(
              icon: Icons.search_outlined,
            ),
            FloatingNavbarItem(
              icon: Icons.shopping_cart_outlined,
            ),
            FloatingNavbarItem(
              icon: Icons.person_outline,
            ),
          ]),
      body: pages.elementAt(currentIndex),
    );
  }
}
