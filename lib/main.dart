import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.transparent)
    ),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
