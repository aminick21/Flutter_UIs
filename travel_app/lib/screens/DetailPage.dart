import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/HomePage.dart';

import '../colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex=value;
          });
        },
        selectedLabelStyle: TextStyle(
            color: pinkColor,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        unselectedFontSize: 0,
        backgroundColor: blackColor,
        unselectedItemColor: greyColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          bottomNaviItem(Icons.home_outlined),
          bottomNaviItem(Icons.search_outlined),
          bottomNaviItem(Icons.camera_alt_outlined),
          bottomNaviItem(Icons.account_circle_outlined),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/japan.jpg",
                ),
                fit:BoxFit.cover
              )
            ),
          ),

          BackdropFilter(filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
          child: Container(
            color: Colors.black.withOpacity(.6),
          ),),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: pinkColor,
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
                      ),
                    ),
                    Text("JAPAN",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5
                      ),),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Icon(Icons.bookmark_border,
                          size: 25,color: Colors.white,),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending Attractions",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    Text(":",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                  ],
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  height: height/ 2 - 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/kyoto.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.7), BlendMode.darken)
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kyoto Tour",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),
                            SizedBox(height: 10,),
                            Text("Three day tour around kyoto",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                              ),),]

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(">",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: pinkColor,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Weekly Highlights",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                ),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Container(
                height: height/4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right:5),
                      child: Container(
                        height: height/ 2 - 180,
                        width: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/japan.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.7), BlendMode.darken)
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(">",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          color: pinkColor,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Takashi Castle",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),),
                                        SizedBox(height: 10,),
                                        Text("\$200-400 ",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),),]

                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right:5),
                      child: Container(
                        height: height/ 2 - 180,
                        width: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bridge.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.7), BlendMode.darken)
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(">",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          color: pinkColor,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Heaven's Gate",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),),
                                        SizedBox(height: 10,),
                                        Text("\$50-150 ",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),),]

                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right:5),
                      child: Container(
                        height: height/ 2 - 180,
                        width: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/himeji-castle.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.7), BlendMode.darken)
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(">",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          color: pinkColor,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Hemiji Castle",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),),
                                        SizedBox(height: 10,),
                                        Text("\$200-300",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),),]

                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),)

            ],
          )

        ],
      ),
    );
  }
}
