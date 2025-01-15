import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Container()),
      appBar: AppBar(
        title: Center(child: Text("support screen")),
      ),
    );
  }
}