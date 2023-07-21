import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/colors.dart';
import 'package:travel_app/screens/DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var seletedIndex=0;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
        body: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      child: Icon(Icons.filter_list,size: 25,color: Colors.white,),
                    ),
                  ),
                  Text("HOME",
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:Container(
                height: size.height-200,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    itemCard(size,"Japan","Explore the land of rising sun","assets/japan.jpg"),
                    itemCard(size,"Canada","Explore the vast forest of Canada","assets/canada.jpg"),
                  ],
                ),
              )
            )
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pink,
          currentIndex: seletedIndex,
          onTap: (value){
            setState(() {
              seletedIndex=value;
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
      );
  }
}

class itemCard extends StatelessWidget {
  final Size size;
  final String title;
  final String subTitle;
  final String imgAdd;

  itemCard(this.size, this.title, this.subTitle, this.imgAdd);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 30),
      child: Stack(
          children: [
            Container(
              height: size.height / 2 - 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgAdd),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.7), BlendMode.darken)
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            Container(
              height: size.height / 2 - 100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    SizedBox(height: 10,),
                    Text(subTitle,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage())),
                      child: Container(
                        height: 50,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Explore Now",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: pinkColor,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]
      ),

    );
  }

}


BottomNavigationBarItem bottomNaviItem(var icon){
  return BottomNavigationBarItem(
      icon:Icon(icon),
      backgroundColor:Colors.black,
    label: ".",
  );
}


