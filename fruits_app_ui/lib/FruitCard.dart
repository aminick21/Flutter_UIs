import 'package:flutter/material.dart';
import 'package:fruits_app_ui/FruitDetailPage.dart';

import 'CartPage.dart';
import 'FruitModel.dart';

class FruitCard extends StatefulWidget {
 int index;

 FruitCard(this.index);

 @override
  State<FruitCard> createState() => _FruitCardState();
}

class _FruitCardState extends State<FruitCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: double.maxFinite,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color:listOfFruits[widget.index].bgColor.withOpacity(.9),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitDetailPage(widget.index)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Hero(
                  tag: widget.index,
                  child: Image.asset(listOfFruits[widget.index].imgPath,height: 220,)),

              Text("\$${listOfFruits[widget.index].price}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text("${listOfFruits[widget.index].shDes}",
                  maxLines: 3,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                      color:Colors.white.withOpacity(.7),
                      fontSize: 20,
                  ),
                ),
              ),SizedBox(height: 5),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(.3),
                  ),
                 child: Center(
                   child: Text("Add to Cart",
                     style: TextStyle(
                       color: Colors.white.withOpacity(.9),
                       fontSize: 18,

                     ),
                   ),
                 ),
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
        ));
  }
}
