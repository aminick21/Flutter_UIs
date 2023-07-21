import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottomBar.dart';

class DetailPage extends StatefulWidget {
String name;
String imgPath;
String price;

DetailPage(this.name,this.imgPath,this.price);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: Text("Pickup",style: GoogleFonts.varela(fontSize: 20,color: Color(0xFF545D68)),),
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Color(0xFF545D68)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.notifications_none,color: Color(0xFFEF7532),),
          SizedBox(width: 10,)
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.fastfood),
        backgroundColor:Color(0xFFEF7532) ,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: ListView(
        children: [
          SizedBox(height:20,),
          Padding(
            padding:EdgeInsets.only(left: 20),
            child: Text("Cookie",style: GoogleFonts.varela(fontSize: 42,fontWeight: FontWeight.bold,color: Color(0xFFEF7532))),
          ),
          SizedBox(height: 60.0),
          Hero(
              tag: widget.imgPath,
              child: Image.asset(widget.imgPath,
                  height: 200.0,
                  width: 150.0,
                  fit: BoxFit.contain
              )
          ),
          SizedBox(height: 40.0),

          Center(
            child: Text(widget.price,
                style: GoogleFonts.varela(fontSize: 24,fontWeight: FontWeight.bold,color:Color(0xFFF17532) ),)
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(widget.name,
                style: GoogleFonts.varela(fontSize: 26,fontWeight: FontWeight.bold,color:Color(0xFF575E67) ),),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                  textAlign: TextAlign.center,
                style: GoogleFonts.varela(fontSize: 18,color:Color(0xFFB4B8B9) ),),
            ),
          ),
          SizedBox(height: 30.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFFF17532)
                  ),
                  child: Center(
                      child: Text('Add to cart',
                        style: GoogleFonts.varela(fontSize: 14,fontWeight:FontWeight.bold ,color:Colors.white ),),
                      )
                  )
              ),
        ],

      ),
    );
  }
}
