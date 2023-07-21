
import 'package:flutter/material.dart';
import 'package:fruits_app_ui/CartPage.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import 'FruitModel.dart';

class FruitDetailPage extends StatefulWidget {
  int index;
  FruitDetailPage(this.index, {super.key});
  @override
  State<FruitDetailPage> createState() => _FruitDetailPageState();
}

class _FruitDetailPageState extends State<FruitDetailPage> {
late Fruit currFruit;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    currFruit=listOfFruits[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: currFruit.bgColor.withOpacity(.9),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon:Icon(Icons.arrow_back,color: Colors.white,),),
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                          },
                          icon:Icon(Icons.shopping_cart,color: Colors.white,),),
                      ],),
                  ),
                  SizedBox(height: 10,),
                  Expanded(child: Hero(
                      tag:widget.index,
                      child: Image.asset(currFruit.imgPath))),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),

                    child: Text(currFruit.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                    ),)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothStarRating(
                              allowHalfRating: false,
                              starCount: 5,
                              rating: currFruit.rating,
                              size: 30.0,
                              color: Colors.yellow.withOpacity(.9),
                              borderColor: Colors.yellow.withOpacity(.9),
                              spacing:0.0
                          ),
                          Text("${currFruit.rating}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(.6)
                          ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text("${currFruit.lgDes}",
                        style: TextStyle(
                            fontSize: 18,
                          color: Colors.black.withOpacity(.6),
                          overflow: TextOverflow.ellipsis,
                        ),
                      maxLines: 10,),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(child: Container(
                          height: 50,
                          child: Center(
                            child:Text("\$ "+currFruit.price,
                              style:TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.w500,
                          ),),),
                        )),
                        Expanded(child:

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                              color: currFruit.bgColor,
                            ),
                            height: 50,
                            child: Center(child: Text("Buy Now",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),),
                            ),

                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
