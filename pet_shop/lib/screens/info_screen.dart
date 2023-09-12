import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/color.dart';
import 'package:pet_shop/model/pets_model.dart';

class InfoScreen extends StatefulWidget {
  final Pets pet ;
  const InfoScreen(this.pet, {super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> imgPosition;
  late Animation<double> imgScale;


  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    imgPosition=Tween<Offset>(begin:Offset(0,0.3),end: Offset(0,0)).animate(animationController);
    imgScale=Tween<double>(begin:0.5 ,end: 1).animate(animationController);
    animationController.forward();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment:
            Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: MediaQuery.of(context).padding.top),
              width: width,
              height: height/1.6,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.only(bottomLeft: Radius.circular(736),bottomRight:Radius.circular(736))
                ),
                color: blueColor
              ),

              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Image.asset('assets/Avatar.png'),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    bottom: 160,
                    child: SizedBox(
                     height: 350,
                     width: 350,
                     child:  ScaleTransition(
                       scale: imgScale,
                       child: SlideTransition(
                           position: imgPosition,
                           child: Image.asset(widget.pet.image,)),
                     ),
                         ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:height/1.7,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(120),topRight: Radius.circular(120)),
                color: blackColor
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: SizedBox(
                height:height/1.7,
                  width: width,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75,
                            height: 95,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.50, color: Colors.white),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/mic.svg"),
                                SizedBox(height: 5,),
                                Text(
                                  'Friendly',
                                  style: GoogleFonts.mulish(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                                  width: 113,
                                  height: 132,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(height: 10,),
                                      Image(image: AssetImage("assets/stars.png"),fit: BoxFit.cover,),
                                      Text(
                                        'Neat',
                                        style: GoogleFonts.mulish(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          height: 1.40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                          Container(
                            width: 75,
                            height: 95,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.50, color: Colors.white),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/pet_paw.svg"),
                                Text(
                                  'Vocal',
                                  style: GoogleFonts.mulish(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Beagle Dog',
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                          ),
                        ),
                        SvgPicture.asset("assets/tick.svg"),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Male | ',
                          style: GoogleFonts.mulish(
                            color: Color(0xFF8E8E8E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.40,
                          ),
                        ),


                        Text(
                          '10 Months',
                          style: GoogleFonts.mulish(
                            color: Color(0xFF8E8E8E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.40,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '3.0 km',
                          style: GoogleFonts.mulish(
                            color: Color(0xFF8E8E8E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.40,
                          ),
                        )

                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About",
                            style: GoogleFonts.mulish(
                                color: Colors.white,
                                fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(widget.pet.about,
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 16
                          ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/msg.svg",),
                        SizedBox(width: 20,),
                        SvgPicture.asset("assets/call.svg",),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(right: 10,left: 5,top: 2,bottom: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/paw_white.svg'),
                              SizedBox(width: 5,),
                              Text(
                                'Add to Cart',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 1.40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )

        ],

      ),
    );
  }
}
