import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Box extends StatelessWidget {
  final String title;
  final String imagePath;
  final String address;

  Box({required this.title, required this.imagePath, required this.address});

  Future<void> _launchURL(BuildContext context) async {
    final Uri uri = Uri.parse(address);
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch URL';
      }
    } catch (e) {
      print('Error launching URL: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open link. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 246, 167),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () => _launchURL(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
