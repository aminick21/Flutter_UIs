import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/color.dart';
import 'package:pet_shop/model/on_boarding_model.dart';
import 'package:pet_shop/screens/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with SingleTickerProviderStateMixin {
  int index=0;

  late AnimationController animationController;
  late Animation<Offset> imgPosition;
  late Animation<double> imgScale;

  late PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    imgPosition=Tween<Offset>(begin:Offset(0,0.3),end: Offset(0,0)).animate(animationController);
    imgScale=Tween<double>(begin:0.8 ,end: 1).animate(animationController);
    animationController.forward();

    _pageController=PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final topPadding=MediaQuery.of(context).viewPadding.top;


    return Scaffold(
      backgroundColor: blueColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(top: topPadding,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png",),
                   Text("Skip",
                    style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 20
                  ),)
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 120,
              child: ScaleTransition(
                scale: imgScale,
                child: SlideTransition(
                  position: imgPosition,
                    child: Image.asset(onBoardingItemList[index].imagePath,)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: height/2,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Image.asset(onBoardingItemList[index].pawPath,height: 60,),
                    const SizedBox(height: 30,),


                    Expanded(
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          itemCount: onBoardingItemList.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Text(
                                  onBoardingItemList[index].heading,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -1,
                                  ),),
                                const SizedBox(height: 20,),
                                Text(
                                  onBoardingItemList[index].bodyText,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    color:const Color(0xFF6A6A6A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.50,
                                  ),
                                ),

                              ],
                            ) ;
                          },),
                    ),




                    InkWell(
                      onTap: (){

                        if(index==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }else{
                          _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                          setState(() {
                            animationController.reset();
                            animationController.forward();
                            index=index+1;
                          });
                        }

                      },
                      child: Container(
                        margin: EdgeInsets.all(40),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.40,
                              ),
                            ),
                            Image.asset('assets/paw.png')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
