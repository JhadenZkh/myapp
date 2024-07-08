import 'package:myapp/pages/mainPage.dart';
import 'package:myapp/pages/welcomePage.dart';
import 'package:myapp/pages/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ecommerce());
}

class ecommerce extends StatelessWidget {
  const ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}