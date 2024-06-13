import 'package:ecoww/ui/cart/cart_screen.dart';
import 'package:ecoww/ui/menu/home_screen.dart';
import 'package:ecoww/ui/product/product_all.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductAllScreen(),
    const CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
            ),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/home.png',
                  color: _selectedIndex == 0
                      ? const Color(0xff497748)
                      : const Color(0xffa5a5a5),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/product.png',
                  color: _selectedIndex == 1
                      ? const Color(0xff497748)
                      : const Color(0xffa5a5a5),
                ),
                label: 'Product',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/cart.png',
                  color: _selectedIndex == 2
                      ? const Color(0xff497748)
                      : const Color(0xffa5a5a5),
                ),
                label: 'Keranjang',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff497748),
            onTap: _onItemTapped,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
