import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app2/models/places.dart';
import 'package:travel_app2/models/user.dart';
import 'package:travel_app2/screens/details_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<IconData>iconList=[
    CupertinoIcons.chat_bubble,
    CupertinoIcons.square_split_2x2_fill
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Feed',
          style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.w500 )
          // TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon:const  Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemExtent: 350,
        physics:const  BouncingScrollPhysics(),
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final TravelPlaces place = places[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (_,animation,__)=>FadeTransition(
                  opacity:animation ,
                  child:DetailScreen(place: place,screenHeight: MediaQuery.of(context).size.height,),
                ),
              ));
            },
            child: Container(
              margin:const  EdgeInsets.only(bottom: 10),
              padding:const  EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(place.imagesUrl.first),
                    fit: BoxFit.cover,
                    colorFilter:
                    const ColorFilter.mode(Colors.black26, BlendMode.darken)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(place.user.urlPhoto),
                      ),
                      const  SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            places[index].user.name,
                            style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          const    Text('yesterday at 7:34 pm',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      const   Spacer(),
                      const   Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        place.name,
                        style:GoogleFonts.inter(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.indigo.shade900,
        child: Icon(Icons.location_on,color: Colors.white,size: 26,),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 50,
        icons: iconList,
        iconSize: 28,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (int ) { },
        activeIndex:1,

        activeColor: Colors.indigo.shade900,
        inactiveColor: Colors.black,
      ),
    );
  }
}
