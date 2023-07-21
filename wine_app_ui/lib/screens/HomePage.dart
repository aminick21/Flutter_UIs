
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:wine_app_ui/model/model.dart';
import 'package:wine_app_ui/screens/DetailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 12.0,
                      spreadRadius: 7.0)
                    ],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ) ),
              Positioned(
                  top: 15.0,
                  right: 15.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                        child: Text('1',
                            style: TextStyle(fontSize: 7.0, color: Colors.white))),
                  )),
              Positioned(
                top:45,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Boutique',
                                style: GoogleFonts.abrilFatface(
                                  fontSize: 25
                                )
                            ),
                            Text('More',
                                style: TextStyle(color: Colors.grey, fontSize: 12.0))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 275,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: wines.map((wine) => (_buildCard(wine,context))).toList(),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,
            top: 30,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Recommend',
                    style: GoogleFonts.abrilFatface(fontSize: 25),),
                const Text('More', style: TextStyle(color: Colors.grey, fontSize: 12.0))
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 275,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:recommendWines.map((wine) => _buildCard(wine,context)).toList(),
            ),
          ),)


        ],
      ),

    );
  }
}
Widget _buildCard(Wine wine,context){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(wine))),

      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4.0,
                  spreadRadius: 5.0,
                  color: Colors.grey.withOpacity(0.1))
            ],
        ),
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 160,
              decoration: BoxDecoration(
                color: wine.bgColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Hero(
                    tag: wine.imgPath,
                    child: Container(
                        height: 125.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(wine.imgPath),
                                fit: BoxFit.contain),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)))))),
            Positioned(
              top: 7.0,
              left: 7.0,
              child: Text(wine.price,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
                top: 7.0,
                right: 10.0,
                child: Icon(Icons.shopping_cart,
                    color: Colors.white, size: 15.0)),
            Positioned(
                top: 7.0,
                right: 10.0,
                child: Icon(Icons.shopping_cart,
                    color: Colors.white, size: 15.0)),
            Positioned(
                top: 175.0,
                left: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(wine.title,
                        style: TextStyle(
                          fontFamily: 'AbrilFatFace',
                          fontSize: 14.0,
                        )),
                    SizedBox(height: 5.0),
                    Text(wine.subTitle,
                        style: TextStyle(
                            fontSize: 11.0, color: Colors.grey)),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        SmoothStarRating(
                          starCount: 5,
                          rating: wine.rating,
                          size: 20,
                          color: Color(0xFF199693),
                          borderColor: Color(0xFF199693),
                        ),
                        SizedBox(width: 3.0),
                        Text(wine.rating.toString(),
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF199693))),
                      ],
                    )
                  ],
                ))


          ],
        ),
      ),
    ),
  );
}