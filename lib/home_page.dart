import 'package:flutter/material.dart';
import 'package:your_app_name/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
          
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          showSelectedLabels: true, // Add this line
          showUnselectedLabels: true, // Add this line
          selectedItemColor:
              Colors.black, // Change selected label color to black
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.explore, color: Color.fromARGB(255, 74, 68, 88)),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/support.png",
                  height: 20,
                  width: 20,
                ),
                label: 'support'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/updates.png"),
                label: 'Updates'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/report.png"), label: 'Report'),
          ]),
    );
  }
}
