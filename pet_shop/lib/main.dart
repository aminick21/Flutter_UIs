import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/screens/home_screen.dart';
import 'package:pet_shop/screens/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
    );
  }
}
