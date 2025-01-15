import 'package:flutter/material.dart';
import 'package:your_app_name/home_body.dart';
import 'package:your_app_name/screens/explore_screen.dart';
import 'package:your_app_name/screens/report_screen.dart';
import 'package:your_app_name/screens/support.dart';
import 'package:your_app_name/screens/support_screen.dart';
import 'package:your_app_name/screens/updates_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //index of current page
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 212, 246, 167),
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          showSelectedLabels: true, // Add this line
          showUnselectedLabels: true, // Add this line
          selectedItemColor:
              Colors.black, // Change selected label color to black
          unselectedItemColor: Colors.black,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/Explore.png", height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/support.png",
                  height: 20, // Explicit height
                  width: 20,
                  color: const Color.fromARGB(102, 0, 0, 0), // Explicit width
                ),
                label: 'Support'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/updates.png",
                  height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Updates'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/report.png",
                  height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Report'),
          ]),
    );
  }
}
