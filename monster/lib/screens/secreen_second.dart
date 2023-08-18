import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monster/colors.dart';
import 'dart:math' as math;

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;


  //pink
  late Animation<double> _pinkScaleAnimation;
  late Animation<Offset> _pinkBoxAnimation;
  late Animation<double> _pinkOpacityAnimation;


  //green
  late Animation<double> _greenScaleAnimation;
  late Animation<Offset> _greenBoxAnimation;
  late Animation<double> _greenOpacityAnimation;

  //blue
  late Animation<double> _blueScaleAnimation;
  late Animation<Offset> _blueBoxAnimation;
  late Animation<double> _blueOpacityAnimation;


  //grey˳
  late Animation<double> _greyScaleAnimation;
  late Animation<Offset> _greyBoxAnimation;
  late Animation<double> _greyOpacityAnimation;

  double greyOpacity = 0;
  double blueOpacity = 0;
  double greenOpacity = 0;
  double pinkOpacity = 0;


  //text animation
  late Animation<Offset> _textAnimation;


  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));


    //pink

    _pinkBoxAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.25,
          curve: Curves.ease,
        )));
    _pinkOpacityAnimation=Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.25,
          curve: Curves.ease,
        )));
    _pinkScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.08,
              0.5,
              curve: Curves.ease,
            )));

    //green

    _greenBoxAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.25,
          0.5,
          curve: Curves.ease,
        )));
    _greenOpacityAnimation=Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.25,
          0.5,
          curve: Curves.ease,
        )));
    _greenScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.35,
              0.75,
              curve: Curves.ease,
            )));


    //blue
    _blueBoxAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          0.75,
          curve: Curves.ease,
        )));
    _blueOpacityAnimation=Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: const Interval(
          0.5,
          0.75,
          curve: Curves.ease,
        )));
    _blueScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.5,
              0.85,
              curve: Curves.ease,
            )));


    //grey
    _greyScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.8,
              1,
              curve: Curves.ease,
            )));
    _greyBoxAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.7,
              1, curve: Curves.ease,)));
    _greyOpacityAnimation=Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          .7,
          1,
          curve: Curves.ease,
        )));

    _animationController.forward();




    //textAnimation
    _textAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.4,
          curve: Curves.ease,
        )));
    //listeners

    _pinkOpacityAnimation.addListener(() {
      setState(() {
        pinkOpacity=_pinkOpacityAnimation.value;
      });
    });

    _greenOpacityAnimation.addListener(() {
      setState(() {
        greenOpacity=_greenOpacityAnimation.value;
      });
    });

    _blueOpacityAnimation.addListener(() { setState(() {
      blueOpacity=_blueOpacityAnimation.value;
    });});

    _greyOpacityAnimation.addListener(() { setState(() {
      greyOpacity=_greyOpacityAnimation.value;
    });});




    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: pinkOpacity,
                child: SlideTransition(
                  position: _textAnimation,
                  child: Text(
                    'Choose \nyour quests',
                    style: GoogleFonts.roboto(
                      fontSize: 48,
                      height: 1,
                      letterSpacing: -3,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 3,
                child: Row(
                  children: [
                    //blue box
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: blueOpacity,
                      child: SlideTransition(
                        position: _blueBoxAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            height: double.maxFinite,
                            color: blueColor,
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    right: -180,
                                    child: Transform.rotate(
                                        angle: -math.pi / 5.5,
                                        child: ScaleTransition(
                                          scale: _blueScaleAnimation,
                                          child: Image.asset(
                                            'assets/monster_purple.png',
                                            height: 300,
                                          ),
                                        ))),
                                const Positioned(
                                    left: 0,
                                    top: 10,
                                    child:  RatingStars(
                                      rating: 2,
                                    )),
                                Positioned(
                                  left: 0,
                                  top: 40,
                                  child: Text(
                                    'Help Steve\nsolve the\nmystery',
                                    style: GoogleFonts.openSansCondensed(
                                      fontSize: 28,
                                      height: 1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: Column(
                        children: [
                          //pink box
                          Expanded(
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 100),
                              opacity: pinkOpacity,
                              child: SlideTransition(
                                position:_pinkBoxAnimation ,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    color: pinkColor,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -40,
                                            right: 0,
                                            child: ScaleTransition(
                                              scale: _pinkScaleAnimation,
                                              child: Image.asset(
                                                'assets/monster_pink.png',
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    40,
                                              ),
                                            )),
                                        const Positioned(
                                            left: 0,
                                            top: 10,
                                            child: RatingStars(
                                              rating: 2,
                                            )),
                                        Positioned(
                                          left: 0,
                                          top: 40,
                                          child: Text(
                                            'Weasley is afraid\nof something',
                                            style: GoogleFonts.openSansCondensed(
                                              fontSize: 20,
                                              height: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //green box
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              opacity: greenOpacity,
                              duration:  Duration(milliseconds: 100),
                              child: SlideTransition(
                                position: _greenBoxAnimation,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: greenColor,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -40,
                                            right: -65,
                                            child: ScaleTransition(
                                              scale:_greenScaleAnimation ,
                                              child: Image.asset(
                                                'assets/monster_green.png',
                                                width: 240,
                                              ),
                                            )),
                                        const Positioned(
                                            left: 10,
                                            top: 20,
                                            child: RatingStars(
                                              rating: 2,
                                            )),
                                        Positioned(
                                          left: 20,
                                          bottom: 10,
                                          child: Text(
                                            'Bully at\nschool',
                                            style: GoogleFonts.openSansCondensed(
                                              fontSize: 20,
                                              height: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const  SizedBox(
                height: 10,
              ),
              Flexible(
                  child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: greyOpacity,
                child: SlideTransition(
                  position: _greyBoxAnimation,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: greyColor,
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: -80,
                              right: 0,
                              child: ScaleTransition(
                                scale: _greyScaleAnimation,
                                child: Image.asset(
                                  'assets/monster_grey.png',
                                  width: 240,
                                ),
                              )),
                          const Positioned(
                              left: 10,
                              top: 20,
                              child: RatingStars(
                                rating: 2,
                              )),
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Text(
                              'What\nhappened\nto Stanley?',
                              style: GoogleFonts.openSansCondensed(
                                fontSize: 20,
                                height: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final int rating;
  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> starsList() {
      List<Widget> stList = [];
      int count = rating;
      for (int i = 0; i < 5; i++) {
        if (count > 0) {
          stList.add(
            const Icon(
              CupertinoIcons.star_fill,
              color: Colors.white,
              size: 14,
            ),
          );
        } else {
          stList.add(
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.white.withOpacity(.3),
              size: 14,
            ),
          );
        }
        count--;
      }
      return stList;
    }

    return Container(
        width: 90,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.2),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: starsList(),
        ));
  }
}
