import 'package:flutter/material.dart';
import 'package:myapp/screens/cart/cart_view.dart';
import 'package:myapp/screens/home/home_view.dart';
import 'package:myapp/screens/popular/popular_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List screens = [
  const HomeView(),
  const PopularProduct(),
  const CartScreen(),
];

var selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xffAA14F0),
          unselectedItemColor: Colors.grey[500],

          // type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Faviourite'),
            BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
