import 'package:Calicut_compass/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Use the generated options);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 232, 245, 233),
    );
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
          colorScheme: colorScheme,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.transparent),
          cardColor: Color.fromARGB(255, 212, 246, 167),
          scaffoldBackgroundColor: Color(0xFFE8F5E9),
          dialogBackgroundColor: Color.fromARGB(255, 212, 246, 167)),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
