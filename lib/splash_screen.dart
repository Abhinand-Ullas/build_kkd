import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconController;

  @override
  void initState() {
    super.initState();

    // Animation controller for heart icon
    _iconController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Makes the heart pulse

    // Navigate to home page after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated heart icon
            ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.2).animate(
                CurvedAnimation(
                  parent: _iconController,
                  curve: Curves.easeInOut,
                ),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 80,
              ),
            ),
            const SizedBox(height: 20), // Space between icon and text
            // Animated text
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: const Text(
                    'Welcome to Kozhikode',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
