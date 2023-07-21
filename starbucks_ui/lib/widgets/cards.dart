import 'package:flutter/material.dart';
import 'package:starbucks_ui/colors.dart';
import 'package:starbucks_ui/model/drink.dart';
import 'dart:math'as math;

class DrinkCard extends StatefulWidget   {
  Drink drink;
  double pageOffset;
  int index;
  DrinkCard(this.drink,this.pageOffset,this.index);

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var cardWidth=size.width-60;
    var cardHeight=size.height*.55;
     var count=0.0;
     var page=0.0;


     for(page=widget.pageOffset;page>1;){
         page--;
         if(page==1){
           page-=0.001;
         }
         count++;
     }

     var animation=Curves.easeInBack.transform(page);
     var animate = 100*(count+animation);
     var columnAnimation = 50*(count+animation);
     var rotate = widget.index-widget.pageOffset;

     for(int i=0;i<widget.index;i++){
         animate-=100;
         columnAnimation-=50;
     }

    return Container(
      child: Stack(
        children: [
          buildTopText(widget.drink),
          buildBackgroundImage(widget.drink,cardHeight,cardWidth,size),
          buildAboveCard(widget.drink,cardHeight,cardWidth,size,columnAnimation),
          buildCupImage(widget.drink,size,rotate),
          buildBlurImage(widget.drink,size,cardWidth,animate),
          buildSmallImage(widget.drink,size,animate),
          // buildTopImage(widget.drink,size,cardHeight,cardWidth,animate),
            AnimatedPositioned(
              curve: Curves.ease,
              duration: Duration(milliseconds: 100),
            left:cardWidth/2 - animate,
            bottom: size.height*.15+cardHeight-70,
            child: Image.asset(widget.drink.imageTop)),



        ],
      ),
    );
  }
}

Widget buildTopText(Drink drink){
  return Padding(padding: EdgeInsets.only(top: 30,left: 10),
  child:Row(
    children: [
      Text(drink.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: drink.lightColor
        ),
      ),
      Text(drink.conName,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: drink.darkColor,
        ),
      ),
    ],
  ),

  );
}
Widget buildBackgroundImage(Drink drink,double height,double width,Size size){
  return Positioned(
      height: height,
      width:width,
      bottom: size.height*.10,
      child:Container(
        margin: EdgeInsets.only(left: 20,right: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child:Image.asset(drink.backgroundImage,fit: BoxFit.cover,),
        ),
      )
  );
}
Widget buildAboveCard(Drink drink,double height,double width,Size size,col){
  return Positioned(
      height: height,
      width:width,
      bottom: size.height*.10,
      child:Container(
        margin: EdgeInsets.only(left: 20,right: 30),
        decoration: BoxDecoration(
          color: drink.darkColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(30),
        child: Transform.translate(
          offset: Offset(-col,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Frappuccino",
                style:TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ) ,),
              SizedBox(height: 10,),
              Text(drink.desc,
                style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                ) ,),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                SizedBox(height: 5,),
                Image.asset('images/cup_L.png'),
                SizedBox(height: 5,),
                Image.asset('images/cup_M.png'),
                SizedBox(height: 5,),
                Image.asset('images/cup_S.png'),


              ],),
              SizedBox(height: 10,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: mAppGreen,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Text('\$',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),),
                    SizedBox(width: 5,),
                    Text(drink.price,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )

  );

}
Widget buildCupImage(Drink drink,Size size,rotate){
  return Positioned(
    bottom: 20,
    right: -size.width*.1+35,
    child: Transform.rotate(
        angle:-math.pi/14*rotate,
        child: Image.asset(drink.cupImage,height: size.height*.55-15,)),

  );
}
Widget buildTopImage(Drink drink,Size size,double height,double width,animate){
  return Positioned(
    left: width/4-animate,
      bottom: size.height*.15+height-70,
      child: Image.asset(drink.imageTop));
}
Widget buildSmallImage(Drink drink,Size size,animate){
  return Positioned(
      right: -10.0+animate,
      top: size.height*.3,
      child: Image.asset(drink.imageSmall));
}
Widget buildBlurImage(Drink drink,Size size,double width,animate){
  return Positioned(
      right: width/2-60+animate,
      bottom: size.height*.10,
      child: Image.asset(drink.imageBlur));
}