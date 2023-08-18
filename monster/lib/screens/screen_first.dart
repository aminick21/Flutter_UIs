import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monster/colors.dart';
import 'package:monster/screens/secreen_second.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _ScreenFirstState();
}

class _ScreenFirstState extends State<ScreenFirst>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _borderAnimation;
  late Animation<double> _widthAnimation;


  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 1), vsync: this);

    _borderAnimation =
        Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5,1, curve: Curves.linear)));
    _widthAnimation = Tween<double>(begin: 0, end: 30).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.linear)));
    super.initState();
  }


  onButtonTap() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 180,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/radish_boy.png', fit: BoxFit.cover),
              ),
              Expanded(
                child: Container(
                    decoration:const BoxDecoration(color: darkGreenColor5)),
              )
            ],
          ),
          Positioned(
              bottom: 20,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help Your Monster Friend',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 48,
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'The research-based app will help your child master a problem-solving strategy.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.withOpacity(.9),
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                      },

                      child:  Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30 - _widthAnimation.value,
                                vertical: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: _borderAnimation.value,
                                ),
                                color: lightGreenColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // fontWeight: FontWeight.w300
                              ),
                            ),
                    ),),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
