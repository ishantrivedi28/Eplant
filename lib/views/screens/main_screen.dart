import 'package:eplant/constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageIndex[pageIdx],
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: greenColor,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: pageIdx,
                  backgroundColor: Colors.white,
                  onTap: (index) {
                    setState(() {
                      pageIdx = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outlined),
                        label: 'Favourites'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month_outlined),
                        label: 'Schedules'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
