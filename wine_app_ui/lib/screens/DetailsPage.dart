import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/model.dart';

class DetailPage extends StatefulWidget {
 final Wine wine;
 DetailPage(this.wine);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height/1.5,
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
            Container(height: 400,
                decoration: BoxDecoration(
                  color: widget.wine.bgColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
            Positioned(
              top: 30.0,
              left: 10.0,
              right: 10.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Icon(Icons.shopping_cart, color: Colors.white),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 100.0,
                left: 15.0,
                right: 15.0,
                child: Hero(
                    tag: widget.wine.imgPath,
                    child: RotationTransition(
                        turns: AlwaysStoppedAnimation(20 / 360),
                        child: Container(
                          height: 250.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.wine.imgPath))),
                        )))),
            Positioned(
              top:  MediaQuery.of(context).size.height/2,
              left: 15.0,
              right: 15.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.wine.title,
                                style: GoogleFonts.abrilFatface(
                                  fontSize: 30,
                )
                            ),
                            Text(widget.wine.subTitle,
                                style: GoogleFonts.abrilFatface(
                                  fontSize: 13,
                                  color: Colors.grey
                                )

                                // TextStyle(
                                //     fontFamily: 'AbrilFatFace',
                                //     fontSize: 11.0,
                                //     color: Colors.grey
                                // )
                                //

                            )
                          ],
                        ),
                        Text(widget.wine.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                color: widget.wine.bgColor
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text('375ml of California Chardonnay',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey
                        )
                    ),
                    Text('Pair with: Fried chicken, Ramen Noodles, Nachos Supreme',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey
                        )
                    ),
                    Text('Golden Apple Crisp + Rooftop Parties',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey
                        )
                    )
                  ],
                ),
              ),
            )
          ],),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Essentially Geared Wine',
                                style: GoogleFonts.abrilFatface(fontSize:22,)
                          ),
                          Text('Every Journey is An Opportunity',
                              style: GoogleFonts.abrilFatface(fontSize: 13,color: Colors.grey)
                          )
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        color: widget.wine.bgColor.withOpacity(0.5),
                        size: 22.0,
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('Whether it\'s an impromptu gathering with good friends or sustainbly canning wine to keep up with your daily adventures. Together we seek the uncommon.',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
