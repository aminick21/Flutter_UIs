import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/color.dart';
import 'package:pet_shop/model/on_boarding_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  List<String> animals=[
   'All',
   'Cat',
    'Dog',
    'Bird',
    'Rabbit',
    'Fish',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // profile+menu
                Row(
                  children: [
                    Image.asset('assets/menu.png'),
                    Spacer(),
                    Image.asset('assets/Avatar.png'),
                    SizedBox(width: 20,)
                  ],
                ),
                const SizedBox(height: 20,),

                //morning
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Taban 🙌',
                          style: GoogleFonts.mulish(
                            color: Color(0xFF324B49),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Good Morning!!',
                          style: GoogleFonts.mulish(
                            color: Color(0xFFA1A1A1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 37,
                      height: 58,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50, color: Color(0xFFA1A1A1)),
                          borderRadius: BorderRadius.circular(47),
                        ),
                      ),
                      child: Icon(CupertinoIcons.search,size: 20,),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                //tab bar
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: animals.length,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 73,
                          height: 43,
                          decoration: ShapeDecoration(
                            color: index==0?Colors.black:whiteColor,
                            shape: RoundedRectangleBorder(
                              side:const BorderSide(width: 0.50,
                                  color: Color(0xFFA1A1A1)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              animals[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                color: index==0?Colors.white:Color(0xFFA1A1A1),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                  }
                  ),
                ),
                const SizedBox(height: 20,),

                // list view
                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 200,
                        height: 280,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 90,
                              backgroundColor: blueColor,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.asset('assets/dog_home.png',width: double.maxFinite,alignment: Alignment.centerRight,height: 300,)),
                            ),
                            const SizedBox(height: 10,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Familiar Dog ( ',
                                    style: GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Brown',
                                    style: GoogleFonts.mulish(
                                      color: Color(0xFFCC7F44),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Color)',
                                    style:GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              '\$140.00',
                              style: GoogleFonts.mulish(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 280,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 90,
                              backgroundColor: blueColor,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.asset('assets/cat_home.png',width: double.maxFinite,alignment: Alignment.centerRight,height: 300,)),
                            ),
                            const SizedBox(height: 10,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Soft Cat ( ',
                                    style: GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Grey',
                                    style: GoogleFonts.mulish(
                                      color: Color(0xFF565352),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Color)',
                                    style:GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              '\$140.00',
                              style: GoogleFonts.mulish(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //see more
                Container(
                  width: 138.60,
                  height: 39,
                  decoration: ShapeDecoration(
                    color: Color(0xFFAAD5D1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(58.80),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/paw.png',
                      height: 39,),
                      SizedBox(width: 10,),
                      Text(
                        'See more',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          color: Colors.black,
                          fontSize: 14.40,
                          fontWeight: FontWeight.w700,
                          height: 1.40,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Expensive Pets',
                      style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius:BorderRadius.circular(20),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/1.8,
                          color: Color(0xFFE0CDBA),
                          child: Stack(
                            children: [
                              Positioned(
                                top:10,
                                left: 10,
                                child:Text(
                                'Familiar Dog\nBlack Color',
                                style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  height: 1.41,
                                ),
                              ),),
                              Positioned(
                                right: 0,
                                  bottom: -50,
                                  child: Image.asset('assets/dog1.png',
                                  height: 200,))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius:BorderRadius.circular(20),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/1.8,
                          color: blueColor,
                          child: Stack(
                            children: [
                              Positioned(
                                top:10,
                                left: 10,
                                child:Text(
                                  'Familiar Cat\nFluffy and nice',
                                  style: GoogleFonts.mulish(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    height: 1.41,
                                  ),
                                ),),
                              Positioned(
                                  right: -20,
                                  bottom: -50,
                                  child: Transform.rotate(
                                    alignment: Alignment.center,
                                    angle: -.3,
                                    child: Image.asset('assets/cat_inv.png',
                                      height: 200,),
                                  ))
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
