import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app_ui/CartModel.dart';
import 'package:fruits_app_ui/FruitModel.dart';
import 'package:fruits_app_ui/home_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:Icon(Icons.arrow_back,color: Colors.grey,),),
                Text(
                  "My Cart",
                    style: TextStyle(
                        fontWeight:FontWeight.w600,
                        fontSize: 22,
                      color: Colors.grey
                    )

                ),
                SizedBox(width: 80,)
              ],),

            Expanded(child: Container(
              child: ListView.builder(
                itemCount: 3,
                  itemBuilder:(context, index){
                  return ItemCard(index);
                  },

              ),
            )),
            Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20),
                    child: RichText(text:TextSpan(
                      children: [
                        TextSpan(text: "A total of : ",style:TextStyle(
                            fontSize: 22,
                          color: Colors.grey
                        ) ),
                        TextSpan(text:" \$ 27..3",style: TextStyle(
                          fontWeight:FontWeight.w600,
                          fontSize: 24,
                          color: Colors.orange
                        )),
                      ])),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width-200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:Color(0xff1b4314),
                      ),
                      child: Center(
                        child: Text(" Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  var index;
ItemCard(this.index);
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.6),
              blurRadius: 20,
              offset: Offset(
                5,1
              )

            )
          ],
          color: Colors.white

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(listOfFruits[widget.index].imgPath,height: 110,width: 110,fit:BoxFit.contain
                  ,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width-190,
                      child: RichText(
                          maxLines:2,
                          overflow: TextOverflow.ellipsis,
                          text:TextSpan(
                          children: [
                            TextSpan(text:listOfFruits[widget.index].name+" - " ,style:TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.8)
                            ) ),
                            TextSpan(text:listOfFruits[widget.index].shDes,
                                style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey
                            )),
                          ])),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width-190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("\$ "+listOfFruits[widget.index].price,
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w600,
                            color:Colors.orange,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            borderRadius: BorderRadius.circular(10),

                          ),
                            child: Center(child: Icon(Icons.horizontal_rule,size: 18,))
                        ),
                        SizedBox(width: 10,),
                        Text("1"),
                        SizedBox(width: 10,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Center(child: Icon(Icons.add,size: 18,)),
                        ),

                        SizedBox(width: 10,)
                      ],
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
