import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Confetti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ConfettiController _controller;


  @override
  void initState() {
    super.initState();
    _controller =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Party Time',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Color(0xffD4EDF4),
        body: SafeArea(
          child: Stack(
          children: <Widget>[
            //TOP CENTER - shoot down
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controller,
                blastDirection: pi / 2,
                maxBlastForce: 4, // set a lower max blast force
                minBlastForce: 2, // set a lower min blast force
                emissionFrequency: 0.05,
                numberOfParticles: 50, // a lot of particles at once
                gravity: 0.05,

              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,

              child: Container(
                margin:const EdgeInsets.only(bottom: 80),
                child: MaterialButton(
                  elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      _controller.play();
                    },
                    child: _display('Play')),
              ),
            ),

          ],
      ),
        ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
    );
  }
}
