import 'package:cookie_ui/screens/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookieCard extends StatefulWidget {

  String name;
  String price;
  String imgPath;
  bool isFav;
  var context;
  CookieCard(this.name,this.price,this.imgPath,this.isFav,this.context);
  @override
  State<CookieCard> createState() => _CookieCardState();
}

class _CookieCardState extends State<CookieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(
            widget.name,widget.imgPath,widget.price
          )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],color: Colors.white,
          ),
          child:Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        widget.isFav
                            ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                            : Icon(Icons.favorite_border,
                            color: Color(0xFFEF7532)),
                        SizedBox(width: 5,)
                      ])),
              Hero(
                  tag: widget.imgPath,
                  child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imgPath),
                              fit: BoxFit.contain)))),
              Text(widget.price,style: GoogleFonts.varela(fontSize: 14,color: Color(0xFFCC8053),),),
              Text(widget.name,style: GoogleFonts.varela(fontSize: 16,color: Color(0xFF575E67),),),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Color(0xFFEBEBEB), height: 2.0)),
              Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                          Icon(Icons.shopping_basket,
                              color: Color(0xFFD17E50), size: 14.0),
                          SizedBox(width: 5,),
                          Text('Add to cart',
                              style:GoogleFonts.varela(fontSize: 14,color: Color(0xFFD17E50)),)

                      ]
                          ))


            ],
          ),
        ),
      ),
    );
  }
}
