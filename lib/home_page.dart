import 'package:flutter/material.dart';
import 'package:your_app_name/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(items: [

        BottomNavigationBarItem(icon: Icon(Icons.explore),
        label: 'Explore'),

        BottomNavigationBarItem(icon: Image.asset("images/support.png"),
        label: 'Support'),
        BottomNavigationBarItem(icon: Image.asset("images/updates.png"),
        label: 'Updates'),
        BottomNavigationBarItem(icon: Image.asset("images/report.png"),
        label: 'Report'),
        
      ]),
    );
  }
}