import 'package:concentric_transition/page_route.dart';
import 'package:concentric_transition/page_view.dart';
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
      title: 'Concentric OnBoarding',
      home: OnboardingExample(),
    );
  }
}

class OnboardingExample extends StatelessWidget {
  const OnboardingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: [Color(0xFF221F1E),Color(0xFFEF895F),Color(0xFF221F1E),Color(0xFFEF895F)],
        radius: screenWidth * 0.1,
        curve: Curves.ease,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: screenWidth * 0.08,
          ),
        ),
        // itemCount: pages.length,
        // duration: const Duration(milliseconds: 1500),
        // opacityFactor: 2.0,
        // scaleFactor: 0.2,
        // verticalPosition: 0.7,
        // direction: Axis.vertical,
        itemCount: 3,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(itemList[index].imagePath),
                    Text(itemList[index].headingText,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    SizedBox(height: 30,),
                    Text(itemList[index].bodyText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ],
            ),
              ),
          );
        },
      ),
    );
  }
}

class PageData{
  String imagePath;
  String headingText;
  String bodyText;

  PageData(this.imagePath, this.headingText, this.bodyText);
}

List<PageData> itemList=[
  PageData('assets/Saly-1.png', "Boost Productivity", "Helps you boost your productivity on a different level"),
  PageData('assets/Saly-2.png', "Work Seamlessly", "Get your work done seamlessly\nwithout interruption"),
  PageData('assets/Saly-3.png', "Achieve Higher Goals","By boosting your productivity we help you achieve higher goals")
];