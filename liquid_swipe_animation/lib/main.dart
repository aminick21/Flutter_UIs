import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe_animation/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Swipe',
      home: LiquidSwipes(),
    );
  }
}

class LiquidSwipes extends StatefulWidget {
  const LiquidSwipes({super.key});

  @override
  State<LiquidSwipes> createState() => _LiquidSwipesState();
}

class _LiquidSwipesState extends State<LiquidSwipes> {

  final pages = [
    const Screens(
      backgroundColor: whiteColor,
      headingColor: Colors.black,
      image: 'assets/img1.png',
      text1: 'Know your',
      text2: 'Neighbours',
      text3: 'Learn more about people living next to you.',
    ),
    const Screens(
      backgroundColor: greenColor,
      headingColor: Colors.white,
      image: 'assets/img2.png',
      text1: 'Get some',
      text2: 'Guidance',
      text3: 'Pick up some tips for a healthier neighbourhood',
    ),
    const Screens(
      backgroundColor: orangeColor,
      headingColor: Colors.white,
      image: 'assets/img3.png',
      text1: 'Receive the',
      text2: 'Rewards',
      text3: 'Help the community grow and get rewarded.',

    )
  ];
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
        pages: pages,
        onPageChangeCallback: (value){

      },
    );

  }
}

class Screens extends StatelessWidget {
  final Color backgroundColor;
  final Color headingColor;
  final String image;
  final String text1;
  final String text2;
  final String text3;

  const Screens(
      {super.key,
      required this.backgroundColor,
      required this.headingColor,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        titleTextStyle: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20, color: headingColor),
        title: const Text('NH.'),
        elevation: 0,
        actions: [
          Container(
            margin:const EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: Text(
            'Skip',
            style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: headingColor.withOpacity(.8)),
        ),
          ),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 30),
            //text1
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                text1,
                style: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: headingColor.withOpacity(.7)),

              ),
            ),
            const SizedBox(height: 5),
            //text2
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
              text2,
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  color: headingColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 18),
            //text3
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width/2+50,
              child: Text(
                text3,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: headingColor.withOpacity(.7)),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
