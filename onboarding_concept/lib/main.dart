import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_concept/model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  late AnimationController _animationController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      reverseDuration: const Duration(seconds: 1),
      duration:const Duration(seconds: 1),
      vsync: this,
    );
    _pageController.addListener(() {
      double currentPage = _pageController.page!;

      double normalizedProgress = currentPage % 1;

      if (normalizedProgress >= 0.5) {
        _animationController.reverse(from: 0.125);
        _animationController.value = 1 - normalizedProgress;
      } else {
        _animationController.value = normalizedProgress;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
              controller: _pageController,
              physics: ClampingScrollPhysics(),
             itemCount: 4,
           itemBuilder: (BuildContext context, int index) {
             return AnimatedContainer(
               color: activeIndex%2==0?Color(0xff8F43EE):Color(0xfffdc43f),
               padding: EdgeInsets.all(20),
               duration: Duration(milliseconds: 200),

             );
           },
            ),

          Positioned(
            top: -120,
            right: -30,
            child: RotationTransition(
              alignment: Alignment.topRight,
              turns: Tween(begin: 0.0, end: .125).animate(CurvedAnimation(
                parent: _animationController,
                curve: Interval(0.0, 0.125, curve: Curves.ease),
              )),
              child: AnimatedContainer(
                transform: Matrix4.rotationZ(pi / 7),
                transformAlignment: Alignment.center,
                duration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height / 2 + 120,
                width: MediaQuery.of(context).size.width + 100,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(80)),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 50,
            child: SizedBox(
              height: 300,
              child: Image.asset('assets/${activeIndex+1}.png'),
            ),
          ),
          Positioned(
          bottom: 0,
            child: Container(
              margin:const EdgeInsets.all(20),
              height:  MediaQuery.of(context).size.height/2 -40,
              width:  MediaQuery.of(context).size.width-40,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemList[activeIndex].heading,
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),
                ),
               const SizedBox(
                  height: 15,
                ),
                Text(itemList[activeIndex].body,
                  style:GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 18,color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child:const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: 4,
                      effect: WormEffect(
                        dotColor: Colors.white,
                        activeDotColor: Colors.black54,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 12,
                      ),
                    ),
                    Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
          ),
            ),)
        ],
      ),
    );
  }
}